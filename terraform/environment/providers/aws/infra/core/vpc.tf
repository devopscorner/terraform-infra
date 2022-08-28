# ==========================================================================
#  Core: vpc.tf
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC Identity
#    - Private Subnet
#    - Main Route Table
# ==========================================================================

# --------------------------------------------------------------------------
#  VPC Tags
# --------------------------------------------------------------------------
locals {
  vps_tags = {
    ResourceGroup = "${var.environment[local.env]}-VPC"
    Name          = "${var.coreinfra}-${var.env[local.env]}-vpc"
  }
}

# --------------------------------------------------------------------------
#  VPC Identity
# --------------------------------------------------------------------------
resource "aws_vpc" "infra_vpc" {
  # cidr                  = "10.0.0.0/16"
  # secondary_cidr_blocks = ["10.1.0.0/16", "10.2.0.0/16"]

  cidr_block           = var.vpc_cidr[local.env]
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags     = merge(local.tags, local.vps_tags)
  tags_all = merge(local.tags, local.vps_tags)
}

