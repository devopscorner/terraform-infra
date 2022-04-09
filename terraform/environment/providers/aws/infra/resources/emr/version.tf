# ==========================================================================
#  Services: EMR / versions.tf (Terraform Library)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Default minimum version Terraform
#    - Dependencies other providers & version
# ==========================================================================

terraform {
  required_version = ">= 1.0.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63.0, < 4.0"
    }
    random = ">= 2.0"
  }
}