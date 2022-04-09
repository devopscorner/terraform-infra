# ==========================================================================
#  Core: igw-ec2.tf (Internet Gate Way for EC2)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - IGW Public Subnet
#    - Route Table Public Subnet from IGW
# ==========================================================================

# --------------------------------------------------------------------------
#  IGW Tags
# --------------------------------------------------------------------------
locals {
  tags_igw_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.igw_rt_prefix}"
  }

  tags_igw = {
    ResourceGroup = "${var.environment[local.env]}-IGW"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.igw_prefix}"
  }

  tags_ec2_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT-EC2"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_rt_prefix}_public"
  }

  tags_ec2 = {
    ResourceGroup = "${var.environment[local.env]}-EC2"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_rt_prefix}_public"
  }

  tags_eks_rt_public = {
    ResourceGroup = "${var.environment[local.env]}-RT-EKS"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_rt_prefix}_public"
  }

  tags_eks = {
    ResourceGroup = "${var.environment[local.env]}-EKS"
    Name          = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_rt_prefix}_public"
  }
}

# --------------------------------------------------------------------------
#  IGW
# --------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.infra_vpc.id

  tags = merge(local.tags, local.tags_igw, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.igw_prefix}" })
}

# --------------------------------------------------------------------------
#  Route Table for IGW
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table" "igw_public" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_igw_rt_public, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.igw_rt_prefix}" })
}

resource "aws_route_table" "ec2_rt_public" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_ec2_rt_public, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_ec2_rt_public" })
}

resource "aws_route_table" "eks_rt_public" {
  vpc_id = aws_vpc.infra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(local.tags, local.tags_eks_rt_public, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_eks_rt_public" })
}
# --------------------------------------------------------------------------
#  Route Table with Public Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_route_table_association" "igw_ec2_rt_public_1a" {
  subnet_id      = aws_subnet.ec2_public_a.id
  route_table_id = aws_route_table.ec2_rt_public.id
}

resource "aws_route_table_association" "igw_ec2_rt_public_1b" {
  subnet_id      = aws_subnet.ec2_public_b.id
  route_table_id = aws_route_table.ec2_rt_public.id
}

## EKS
resource "aws_route_table_association" "igw_eks_rt_public_1a" {
  subnet_id      = aws_subnet.eks_public_a.id
  route_table_id = aws_route_table.eks_rt_public.id
}

resource "aws_route_table_association" "igw_eks_rt_public_1b" {
  subnet_id      = aws_subnet.eks_public_b.id
  route_table_id = aws_route_table.eks_rt_public.id
}
