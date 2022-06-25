# ==========================================================================
#  Core: sg.tf
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Security Group Default
# ==========================================================================

# --------------------------------------------------------------------------
#  Security Group Tags
# --------------------------------------------------------------------------
locals {
  sg_tags = {
    Name            = "devopscorner-sg-ssh-${var.env[local.env]}"
    ResourceGroup   = "${var.environment[local.env]}-SG-VPC"
  }
}

resource "aws_security_group" "default" {
  name        = "devopscorner-sg-ssh-${var.env[local.env]}"
  description = "SSH Private Subnet"
  vpc_id      = aws_vpc.infra_vpc.id

  ingress {
    description = "SSH Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      var.ec2_public_a[local.env],
      var.ec2_public_b[local.env],
      var.eks_public_a[local.env],
      var.eks_public_b[local.env]
    ]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Node all egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(local.tags, local.sg_tags)

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}