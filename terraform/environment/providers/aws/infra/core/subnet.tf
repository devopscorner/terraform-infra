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

  tags_elb = {
    "kubernetes.io/role/elb" = "1"
  }

  tags_internal_elb = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

# --------------------------------------------------------------------------
#  Private Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_subnet" "ec2_private_a" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.ec2_private_a[local.env]
  availability_zone = "${var.aws_region}a"

  tags = merge(local.tags, local.tags_ec2_private_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-private-${var.ec2_prefix}-${var.aws_region}a" }, local.tags_internal_elb)
}

resource "aws_subnet" "ec2_private_b" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.ec2_private_b[local.env]
  availability_zone = "${var.aws_region}b"

  tags = merge(local.tags, local.tags_ec2_private_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-private-${var.ec2_prefix}-${var.aws_region}b" }, local.tags_internal_elb)
}

## EKS
resource "aws_subnet" "eks_private_a" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.eks_private_a[local.env]
  availability_zone = "${var.aws_region}a"

  tags = merge(local.tags, local.tags_eks_private_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-private-${var.eks_prefix}-${var.aws_region}a" }, local.tags_internal_elb)
}

resource "aws_subnet" "eks_private_b" {
  vpc_id            = aws_vpc.infra_vpc.id
  cidr_block        = var.eks_private_b[local.env]
  availability_zone = "${var.aws_region}b"

  tags = merge(local.tags, local.tags_eks_private_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-private-${var.eks_prefix}-${var.aws_region}b" }, local.tags_internal_elb)
}

# --------------------------------------------------------------------------
#  Public Subnet
# --------------------------------------------------------------------------
## EC2
resource "aws_subnet" "ec2_public_a" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.ec2_public_a[local.env]
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_ec2_public_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-public-${var.ec2_prefix}-${var.aws_region}a" }, local.tags_internal_elb)
}

resource "aws_subnet" "ec2_public_b" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.ec2_public_b[local.env]
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_ec2_public_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-public-${var.ec2_prefix}-${var.aws_region}b" }, local.tags_internal_elb)

}

## EKS
resource "aws_subnet" "eks_public_a" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.eks_public_a[local.env]
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_eks_public_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-public-${var.eks_prefix}-${var.aws_region}a" }, local.tags_internal_elb)
}

resource "aws_subnet" "eks_public_b" {
  vpc_id                  = aws_vpc.infra_vpc.id
  cidr_block              = var.eks_public_b[local.env]
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = merge(local.tags, local.tags_eks_public_subnet, { Name = "${var.coreinfra}-${var.env[local.env]}-public-${var.eks_prefix}-${var.aws_region}b" }, local.tags_internal_elb)
}
