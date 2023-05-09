# ==========================================================================
#  Resources: EKS-ADOT / main.tf (Main Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Workspace Environment
#    - AWS Provider
#    - Common Tags
# ==========================================================================

# --------------------------------------------------------------------------
#  Workspace Environmet
# --------------------------------------------------------------------------
locals {
  env = terraform.workspace
}

# --------------------------------------------------------------------------
#  Provider Module Terraform
# --------------------------------------------------------------------------
provider "aws" {
  region = var.aws_region

  ## version >= 3.63.0, < 4.0
  shared_credentials_file = "$HOME/.aws/devopscorner/credentials"
  profile                 = "devopscorner"

  ## version >= 4.0
  # shared_config_files      = ["$HOME/.aws/devopscorner/config"]
  # shared_credentials_files = ["$HOME/.aws/devopscorner/credentials"]
  # profile                  = "devopscorner"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
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
