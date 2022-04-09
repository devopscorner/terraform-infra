# ==========================================================================
#  Core: natgw.tf (NAT Gate Way)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - NAT Gateway from Private Subnet
#    - EIP Enabled
#    - Route Table for Private Subnet with NAT Gateway
# ==========================================================================

# --------------------------------------------------------------------------
#  NAT GW Tags
# --------------------------------------------------------------------------
locals {
  ## EC2
  tags_nat_ec2_rt_private = {
    ResourceGroup = "${var.environment[local.env]}-RT-EC2"
  }
  tags_nat_ec2 = {
    ResourceGroup = "${var.environment[local.env]}-NAT-EC2"
  }

  ## EKS
  tags_nat_eks_rt_private = {
    ResourceGroup = "${var.environment[local.env]}-RT-EKS"
  }
  tags_nat_eks = {
    ResourceGroup = "${var.environment[local.env]}-NAT-EKS"
  }
}

# --------------------------------------------------------------------------
#  EIP (enabled)
# --------------------------------------------------------------------------
resource "aws_eip" "eks" {
  tags = {
    "Name" = "${var.myinfra}-${var.env[local.env]}-vpc_eip_eks"
  }

  tags_all = {
    "Name" = "${var.myinfra}-${var.env[local.env]}-vpc_eip_eks"
  }
}

resource "aws_eip" "ec2" {
  tags = {
    "Name" = "${var.myinfra}-${var.env[local.env]}-vpc_eip_ec2"
  }

  tags_all = {
    "Name" = "${var.myinfra}-${var.env[local.env]}-vpc_eip_ec2"
  }
}

# --------------------------------------------------------------------------
#  NAT GW
# --------------------------------------------------------------------------
resource "aws_nat_gateway" "ec2_ngw" {
  allocation_id = aws_eip.ec2.id
  subnet_id     = aws_subnet.ec2_public_a.id

  tags = merge(local.tags, local.tags_nat_ec2, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.nat_ec2_prefix}" })
}

resource "aws_nat_gateway" "eks_ngw" {
  allocation_id = aws_eip.eks.id
  subnet_id     = aws_subnet.eks_public_a.id

  tags = merge(local.tags, local.tags_nat_eks, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.nat_eks_prefix}" })
}

## --------------------------------------------------------------------------
#  Route Table NAT GW
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table" "nat_ec2_rt_private_a" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_ec2_rt_private, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_rt_prefix}_private_1a" })
}

resource "aws_route_table" "nat_ec2_rt_private_b" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ec2_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_ec2_rt_private, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_rt_prefix}_private_1b" })
}

## EKS
resource "aws_route_table" "nat_eks_rt_private_a" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_eks_rt_private, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_rt_prefix}_private_1a" })
}

resource "aws_route_table" "nat_eks_rt_private_b" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw.id
  }

  tags = merge(local.tags, local.tags_nat_eks_rt_private, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_rt_prefix}_private_1b" })
}

# --------------------------------------------------------------------------
#  Route Table with Private Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table_association" "nat_ec2_rt_private_1a" {
  subnet_id      = aws_subnet.ec2_private_a.id
  route_table_id = aws_route_table.nat_ec2_rt_private_a.id
}

resource "aws_route_table_association" "nat_ec2_rt_private_1b" {
  subnet_id      = aws_subnet.ec2_private_b.id
  route_table_id = aws_route_table.nat_ec2_rt_private_b.id
}

## EKS
resource "aws_route_table_association" "nat_eks_rt_private_1a" {
  subnet_id      = aws_subnet.eks_private_a.id
  route_table_id = aws_route_table.nat_eks_rt_private_a.id
}

resource "aws_route_table_association" "nat_eks_rt_private_1b" {
  subnet_id      = aws_subnet.eks_private_b.id
  route_table_id = aws_route_table.nat_eks_rt_private_b.id
}
