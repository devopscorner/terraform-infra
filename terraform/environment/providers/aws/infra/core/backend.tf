# ==========================================================================
#  Core: backend.tf (Storing tfstate)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - S3 Bucket Path
#    - DynamoDB Table
# ==========================================================================

# --------------------------------------------------------------------------
#  Store Path for Terraform State
# --------------------------------------------------------------------------
terraform {
  backend "s3" {
    region         = "ap-southeast-1"
    bucket         = "devopscorner-terraform-remote-state"
    dynamodb_table = "devopscorner-terraform-state-lock"
    key            = "core/terraform.tfstate"
    encrypt        = true
  }
}