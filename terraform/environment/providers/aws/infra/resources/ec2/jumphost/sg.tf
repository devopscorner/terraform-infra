# ==========================================================================
#  Resources: EC2 Jumphost / sg.tf (Security Group Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSH Port
#    - Others Port
# ==========================================================================

resource "aws_security_group" "jumphost" {
  name        = "${var.ec2_name}-${var.env[local.env]}-sg"
  description = "${var.ec2_name}-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "HTTP Port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "${var.access_my_ip}",
      data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr
    ]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = [data.terraform_remote_state.core_state.outputs.security_group_id]
  }

  ingress {
    description = "HTTPS Port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "${var.access_my_ip}",
      data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr
    ]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = [data.terraform_remote_state.core_state.outputs.security_group_id]
  }

  ingress {
    description      = "SSH Port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = [data.terraform_remote_state.core_state.outputs.security_group_id]
  }

  ingress {
    description = "Portainer Container Administration"
    from_port   = 5212
    to_port     = 5212
    protocol    = "tcp"
    cidr_blocks = [
      "${var.access_my_ip}",
      data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr
    ]
    ipv6_cidr_blocks = ["::/0"]
    security_groups  = [data.terraform_remote_state.core_state.outputs.security_group_id]
  }

  ingress {
    description = "Jumphost Web Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [
      "${var.access_my_ip}",
      data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1a_cidr,
      data.terraform_remote_state.core_state.outputs.eks_private_1b_cidr
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
