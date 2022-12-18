# ==========================================================================
#  Resources: RDS goappdb / rds.tf (RDS Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Database Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.rds_name}",
    ResourceGroup = "${var.environment[local.env]}-RDS-DEVOPSCORNER"
  }
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

## Create New KMS
# resource "aws_kms_key" "devopscorner_cmk_sym" {
#   description = "Customer Managed Keys for ${var.kms_env[local.env]} Environment"
#   enable_key_rotation = true
# }

data "aws_kms_key" "cmk_key" {
  key_id = var.kms_key[local.env]
}

## Create New Security Group for DB
resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = [
    data.terraform_remote_state.core_state.outputs.ec2_private_1a[0],
    data.terraform_remote_state.core_state.outputs.ec2_private_1b[0],
    data.terraform_remote_state.core_state.outputs.ec2_private_1c[0],
    data.terraform_remote_state.core_state.outputs.eks_private_1a[0],
    data.terraform_remote_state.core_state.outputs.eks_private_1b[0],
    data.terraform_remote_state.core_state.outputs.eks_private_1c[0]
  ]
}

resource "aws_security_group" "rds_default" {
  name        = "devopscorner-sg-rds-goapp-${var.env[local.env]}"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.terraform_remote_state.core_state.outputs.vpc_id

  ingress {
    description = "PostgreSQL Port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [
      data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1c_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1c_cidr
    ]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = [data.terraform_remote_state.core_state.outputs.security_group_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.tags, local.resources_tags)

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}


############
# Database #
############
module "db" {

  source   = "../../../../../../../modules/providers/aws/officials/terraform-aws-rds"
  multi_az = local.env == "prod" ? true : false

  identifier        = "goapp-${var.env[local.env]}"
  engine            = var.rds_engine
  engine_version    = var.rds_version
  instance_class    = var.db_instance_class[local.env]
  allocated_storage = var.rds_storage_size[local.env]
  storage_encrypted = true
  ## Create New KMS
  # kms_key_id      = aws_kms_key.devopscorner_cmk_sym.arn
  ## Existing CMK ARN
  kms_key_id = data.aws_kms_key.cmk_key.arn

  ## DB_NAME
  db_name = "goappdb"
  ## DB_USER
  username = "postgres"
  ## DB_PASSWORD (static)
  # password = "secret"
  ## DB_PASSWORD (random)
  password = random_password.db_password.result
  ## DB_PORT
  port = "5432"

  # vpc_security_group_ids = [ "${data.terraform_remote_state.core_state.outputs.security_group_id}" ]
  vpc_security_group_ids = [aws_security_group.rds_default.id]

  # disable backups to create DB faster
  backup_retention_period = var.retention_db[local.env]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = local.tags

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  # DB parameter group
  family = var.rds_family

  # DB option group
  major_engine_version = var.rds_major_engine_version

  # Snapshot name upon DB deletion
  # final_snapshot_identifier = "goapp-${var.env[local.env]}"
  skip_final_snapshot = false

  # Database Deletion Protection
  deletion_protection = true

  # ######
  # # ONLY USE THIS IF WANT TO RESTORE DB FROM SNAPSHOT
  # ######
  # # Use DB Snapshot Name inside RDS Console -> Snapshots for snapshot_identifier
  # snapshot_identifier = "sharedprojects-20210506"
  # copy_tags_to_snapshot = true

  # lifecycle {
  #   ignore_changes = [
  #     username,
  #     password,
  #     latest_restorable_time
  #   ]
  # }
}

resource "random_password" "db_password" {
  length  = 16
  special = false
  lower   = true
  upper   = false
}
