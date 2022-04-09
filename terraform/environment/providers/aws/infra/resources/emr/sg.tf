# ==========================================================================
#  Resources: EMR / sg.tf (Security Group Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - SSH Port
#    - Others Port
# ==========================================================================
## *** References ***
## https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-man-sec-groups.html

# ====================================
#  Security Group Master
# ====================================
resource "aws_security_group" "sg_master" {
  name        = "${var.sg_master_name}-${var.env[local.env]}-sg"
  description = "${var.sg_master_name}-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "EMR Managed Security Group Master"
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "EMR Managed Security Group Master"
    from_port        = 9443
    to_port          = 9443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
      tags
    ]
  }

  tags = merge(local.tags, local.resources_tags)
}

# ------------------------------------
#  Security Group Master (Additional)
# ------------------------------------
resource "aws_security_group" "sg_master_add" {
  name        = "${var.sg_master_name}-add-${var.env[local.env]}-sg"
  description = "${var.sg_master_name}-add-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "SSH Port"
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
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
      tags
    ]
  }

  tags = merge(local.tags, local.resources_tags)
}


# ====================================
#  Security Group Slave
# ====================================
resource "aws_security_group" "sg_slave" {
  name        = "${var.sg_slave_name}-${var.env[local.env]}-sg"
  description = "${var.sg_slave_name}-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "EMR Managed Security Group Master"
    from_port        = 8443
    to_port          = 8443
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

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
      tags
    ]
  }

  tags = merge(local.tags, local.resources_tags)
}

# ------------------------------------
#  Security Group Slave (Additional)
# ------------------------------------
resource "aws_security_group" "sg_slave_add" {
  name        = "${var.sg_slave_name}-add-${var.env[local.env]}-sg"
  description = "${var.sg_slave_name}-add-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "SSH Port"
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
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
      tags
    ]
  }

  tags = merge(local.tags, local.resources_tags)
}

# ====================================
#  Security Group Services
# ====================================
resource "aws_security_group_rule" "allow_tcp_from_master_to_service" {
  type                     = "ingress"
  from_port                = 9443
  to_port                  = 9443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg_service_access.id
  source_security_group_id = aws_security_group.sg_master.id
}

resource "aws_security_group_rule" "allow_tcp_from_master_to_slave" {
  type                     = "ingress"
  from_port                = 9443
  to_port                  = 9443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg_slave.id
  source_security_group_id = aws_security_group.sg_master.id
}

resource "aws_security_group" "sg_service_access" {
  name        = "${var.sg_service_access_name}-${var.env[local.env]}-sg"
  description = "${var.sg_service_access_name}-${var.env[local.env]} security groups"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "EMR Managed Security Group Service Access"
    from_port        = 9443
    to_port          = 9443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "EMR Managed Security Group Service Access"
    from_port        = 8443
    to_port          = 8443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    ignore_changes = [
      ingress,
      egress,
      tags,
    ]
  }

  tags = merge(local.tags, local.resources_tags)
}