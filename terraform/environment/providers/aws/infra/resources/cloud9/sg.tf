# ==========================================================================
#  Resources: Cloud9 / sg.tf (Security Group Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSH Port
#    - Others Port
# ==========================================================================

resource "aws_security_group" "cloud9_machine_firewall" {
  name   = "cloud9_machine_sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, local.resources_tags)
}

resource "aws_security_group" "cloud9_efs_firewall" {
  name   = "cloud9_efs_sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    description     = "NFSv4"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.cloud9_machine_firewall.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, local.resources_tags)
}
