# ==========================================================================
#  Resources: EC2 Nifi / sg.tf (Security Group Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSH Port
#    - Others Port
# ==========================================================================

resource "aws_security_group" "nifi" {
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
  # Portainer UI
  ingress {
    from_port        = 5213
    to_port          = 5213
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # HTTP port for NiFi UI
  ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # HTTPS port for NiFi UI
  ingress {
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # HTTPS port for NiFi Registry
  ingress {
    from_port        = 18443
    to_port          = 18443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # Remote Input Socket Port
  ingress {
    from_port        = 10443
    to_port          = 10443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # Cluster Node Protocol Port
  ingress {
    from_port        = 11443
    to_port          = 11443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  # Cluster Node Load Balancing Port
  ingress {
    from_port        = 6342
    to_port          = 6342
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
