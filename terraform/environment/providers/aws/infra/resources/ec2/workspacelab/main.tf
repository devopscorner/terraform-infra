# ==========================================================================
#  Resources: EC2 WorkspaceLab / main.tf (Main Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - WorkspaceLab Environment
#    - AWS Provider
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  WorkspaceLab Environmet
# --------------------------------------------------------------------------
locals {
  env = terraform.workspace
}

# --------------------------------------------------------------------------
#  Provider Module Terraform
# --------------------------------------------------------------------------
provider "aws" {
  region = var.aws_region
}

# --------------------------------------------------------------------------
#  Start HERE
# --------------------------------------------------------------------------
locals {
  tags = {
    Environment     = "${var.environment[local.env]}"
    Department      = "${var.department}"
    DepartmentGroup = "${var.environment[local.env]}-${var.department}"
    Terraform       = true
  }
}