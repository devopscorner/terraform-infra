# ==========================================================================
#  Core: subnet.tf (Subnet)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Public Subnet
#    - Private Subnet
# ==========================================================================

# --------------------------------------------------------------------------
#  Subnet Tags
# --------------------------------------------------------------------------
locals {
  tags_ec2_public_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PUB-EC2"
  }

  tags_eks_public_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PUB-EKS"
  }

  tags_ec2_private_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PRIV-EC2"
  }

  tags_eks_private_subnet = {
    ResourceGroup = "${var.environment[local.env]}-PRIV-EKS"
  }
}

# --------------------------------------------------------------------------
#  Private Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_subnet" "ec2_private_a" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.ec2_private_a[local.env]
  availability_zone = "ap-southeast-1a"

  tags = merge(local.tags, local.tags_ec2_private_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_prefix}_private_1a" })
}

resource "aws_subnet" "ec2_private_b" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.ec2_private_b[local.env]
  availability_zone = "ap-southeast-1b"

  tags = merge(local.tags, local.tags_ec2_private_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_prefix}_private_1b" })
}

## EKS
resource "aws_subnet" "eks_private_a" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.eks_private_a[local.env]
  availability_zone = "ap-southeast-1a"

  tags = merge(local.tags, local.tags_eks_private_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_prefix}_private_1a" })
}

resource "aws_subnet" "eks_private_b" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.eks_private_b[local.env]
  availability_zone = "ap-southeast-1b"

  tags = merge(local.tags, local.tags_eks_private_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_prefix}_private_1b" })
}

# --------------------------------------------------------------------------
#  Public Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_subnet" "ec2_public_a" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.ec2_public_a[local.env]
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_ec2_public_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_prefix}_public_1a" })
}

resource "aws_subnet" "ec2_public_b" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.ec2_public_b[local.env]
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_ec2_public_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.ec2_prefix}_public_1b" })

}

## EKS
resource "aws_subnet" "eks_public_a" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.eks_public_a[local.env]
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_eks_public_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_prefix}_public_1a" })
}

resource "aws_subnet" "eks_public_b" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.eks_public_b[local.env]
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_eks_public_subnet, { Name = "${var.myinfra}-${var.env[local.env]}-vpc_${var.eks_prefix}_public_1b" })
}
