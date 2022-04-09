# ==========================================================================
#  Resources: Cloud9 / cloud9.tf (Cloud9 Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Bootstrap Cloud9
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.bucket_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-CL9-DEVOPSCORNER"
  }
}

locals {
  ssh_pubkey = "${var.cloud9_ssh_public_key}" == "" ? file("~/.ssh/id_rsa.pub") : "${var.cloud9_ssh_public_key}"
  subnet_id  = "${var.env[local.env]}" == "lab" ? data.terraform_remote_state.core_state.outputs.ec2_public_1a[0] : data.terraform_remote_state.core_state.outputs.ec2_public_1b[0]
}

##########
# Cloud9 #
##########

data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}

resource "random_string" "random" {
  length  = 12
  special = false
  lower   = true
  upper   = false
}

resource "aws_eip" "cloud9_machine_ip" {
  vpc = true
}

# ------------------------------------
#  AMI Linux
# ------------------------------------
data "aws_ami" "amzn_linux2" {
  owners      = ["amazon"]
  most_recent = "true"

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "cloud9_ssh_key" {
  key_name   = "cloud9_ssh_key"
  public_key = local.ssh_pubkey
}

resource "aws_spot_fleet_request" "cloud9_spot_request" {
  iam_fleet_role                      = aws_iam_role.cloud9_spot_fleet_role.arn
  spot_price                          = var.cloud9_spot_price
  allocation_strategy                 = "diversified"
  target_capacity                     = 1
  fleet_type                          = "maintain"
  on_demand_target_capacity           = 0
  instance_interruption_behaviour     = "terminate"
  terminate_instances_with_expiration = true
  wait_for_fulfillment                = true
  depends_on = [
    aws_efs_file_system.cloud9_efs,
    aws_efs_mount_target.cloud9_efs_mount,
    aws_efs_access_point.cloud9_efs_main_ap,
    aws_efs_access_point.cloud9_efs_docker_ap
  ]

  # similar with aws_instance
  launch_specification {
    key_name               = aws_key_pair.cloud9_ssh_key.id
    instance_type          = var.cloud9_instance_type
    ami                    = data.aws_ami.amzn_linux2.id
    spot_price             = var.cloud9_spot_price
    iam_instance_profile   = aws_iam_instance_profile.cloud9_ec2_profile.name
    subnet_id              = local.subnet_id
    vpc_security_group_ids = [aws_security_group.cloud9_machine_firewall.id]
    user_data = file("./userdata/user-data.sh")
  }

  tags = merge(local.tags, local.resources_tags)
}

resource "aws_s3_bucket" "cloud9_main_bucket" {
  bucket = var.bucket_name != "" ? var.bucket_name : lower("cloud9-${random_string.random.result}")
  acl    = "private"
}