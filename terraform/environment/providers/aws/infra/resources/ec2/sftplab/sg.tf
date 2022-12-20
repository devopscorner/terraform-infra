# ==========================================================================
#  Resources: EC2 SFTPLab / sg.tf (Security Group Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSH Port
#    - Others Port
# ==========================================================================

resource "aws_security_group" "sftplab" {
  name        = "${var.ec2_name}-${var.env[local.env]}-sg"
  description = "${var.ec2_name}-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  # SSH
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
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
