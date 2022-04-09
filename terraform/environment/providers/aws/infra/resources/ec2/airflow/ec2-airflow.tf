# ==========================================================================
#  Resources: Airflow / airflow.tf (Airflow Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Bootstrap Airflow
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EC2-AIRFLOW"
  }

  ebs_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EBS-AIRFLOW"
  }

  eip_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EIP-AIRFLOW"
  }
}

locals {
  ssh_pubkey = "${var.ssh_public_key}" == "" ? file("~/.ssh/id_rsa.pub") : "${var.ssh_public_key}"
  subnet_id  = "${var.env[local.env]}" == "lab" ? data.terraform_remote_state.core_state.outputs.ec2_public_1a[0] : data.terraform_remote_state.core_state.outputs.ec2_public_1b[0]
}

# ------------------------------------
#  Existing Zone ID (DNS)
# ------------------------------------
locals {
  domain      = "${var.ec2_name}-${var.env[local.env]}.${var.dns_url[local.env]}"
  domain_name = trimsuffix(local.domain, ".")
}

###########
# Airflow #
###########

data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}

resource "aws_key_pair" "airflow_ssh_key" {
  key_name   = "airflow_ssh_key"
  public_key = local.ssh_pubkey
}

resource "aws_instance" "airflow" {
  ami                    = var.ami
  instance_type          = var.ec2_type[local.env]
  monitoring             = true
  availability_zone      = var.aws_az[local.env]
  key_name               = aws_key_pair.airflow_ssh_key.id
  subnet_id              = local.subnet_id
  vpc_security_group_ids = ["${aws_security_group.airflow.id}"]

  tags = merge(local.tags, local.resources_tags)

  security_groups = ["${aws_security_group.airflow.id}"]

  user_data = file("./userdata/amazon-linux.sh")

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }

  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = data.aws_kms_key.cmk_key.arn

    tags = merge(local.tags, local.ebs_tags)
  }
}

# ------------------------------------
#  Elastic IP
# ------------------------------------
resource "aws_eip" "airflow" {
  instance = aws_instance.airflow.id
  tags     = merge(local.tags, local.eip_tags)
}

# ------------------------------------
#  Load Balancer & Domain Routes
# ------------------------------------
resource "aws_route53_record" "airflow" {
  zone_id = var.dns_zone[local.env]
  name    = local.domain_name
  type    = "CNAME"
  ttl     = 300
  records = ["${aws_elb.airflow.dns_name}"]
}

# resource "aws_route53_record" "airflow" {
#   zone_id = var.dns_zone[local.env]
#   name    = local.domain_name
#   type    = "A"

#   alias {
#     name                   = "${aws_elb.airflow.dns_name}"
#     zone_id                = "${aws_elb.airflow.zone_id}"
#     evaluate_target_health = true
#   }
# }
