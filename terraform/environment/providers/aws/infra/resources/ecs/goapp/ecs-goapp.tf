# ==========================================================================
#  Resources: ECS GOApp / ecs-goapp.tf (ECS GOApp Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Bootstrap ECS GoApp
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  resources_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EC2-ECS"
  }

  ebs_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EBS-ECS"
  }

  eip_tags = {
    Name          = "${var.ec2_name}-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-EIP-ECS"
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

#############
# ECS GoApp #
#############

data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}

resource "aws_key_pair" "ecs_ssh_key" {
  key_name   = "ecs_ssh_key"
  public_key = local.ssh_pubkey
}

resource "aws_launch_configuration" "lc" {
  name                        = var.ecs_cluster_name
  image_id                    = "${var.ami_os}" == "aws-linux" ? "${var.ami_aws_linux}" : "${var.ami_ubuntu}"
  instance_type               = var.ec2_type[local.env]
  iam_instance_profile        = aws_iam_instance_profile.ecs_service_role.name
  key_name                    = aws_key_pair.ecs_ssh_key.id
  security_groups             = ["${aws_security_group.ecs.id}"]
  associate_public_ip_address = true

  tags = merge(local.tags, local.resources_tags)

  user_data = <<EOF
#! /bin/bash
sudo yum update
sudo echo "ECS_CLUSTER=${var.ecs_cluster_name}" >> /etc/ecs/ecs.config
EOF

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "devopscorner-poc-asg"
  launch_configuration      = aws_launch_configuration.lc.name
  min_size                  = 2
  max_size                  = 3
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = module.vpc.public_subnets

  target_group_arns     = [aws_lb_target_group.lb_target_group.arn]
  protect_from_scale_in = true

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

# ------------------------------------
#  Elastic IP
# ------------------------------------
resource "aws_eip" "ecs" {
  instance = aws_instance.ecs.id
  tags     = merge(local.tags, local.eip_tags)

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags,
    ]
  }
}

# ------------------------------------
#  Load Balancer & Domain Routes
# ------------------------------------
resource "aws_route53_record" "ecs" {
  zone_id = var.dns_zone[local.env]
  name    = local.domain_name
  type    = "CNAME"
  ttl     = 300
  records = ["${aws_elb.ecs.dns_name}"]
}

# resource "aws_route53_record" "ecs" {
#   zone_id = var.dns_zone[local.env]
#   name    = local.domain_name
#   type    = "A"

#   alias {
#     name                   = "${aws_elb.ecs.dns_name}"
#     zone_id                = "${aws_elb.ecs.zone_id}"
#     evaluate_target_health = true
#   }
# }
