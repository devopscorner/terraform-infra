# ==========================================================================
#  Resources: ECS GOApp S3 / s3.tf (S3 Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Resources Tags
#    - S3 Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  s3_tags = {
    "Name"          = "${var.env[local.env]}" == "prod" ?  "${var.bucket_name}" : "${var.bucket_name}-${var.env[local.env]}",
    "ResourceGroup" = "${var.environment[local.env]}-S3-ECS"
  }
}

###############
# S3 (Object) #
###############
locals {
  bucket_name = "${var.env[local.env]}" == "prod" ?  "${var.bucket_name}" : "${var.bucket_name}-${var.env[local.env]}"
  region      = "${var.aws_region}"
}

data "aws_canonical_user_id" "current" {}

data "aws_cloudfront_log_delivery_canonical_user_id" "cloudfront" {}

# ------------------------------------
#  New KMS
# ------------------------------------
## Create New KMS
# resource "aws_kms_key" "objects" {
#   description             = "KMS key is used to encrypt bucket objects"
#   deletion_window_in_days = 7
# }
# ------------------------------------

# ------------------------------------
#  Existing CMK
# ------------------------------------
## Existing CMK ARN
data "aws_kms_key" "cmk_key" {
  key_id = "${var.kms_key[local.env]}"
}
# ------------------------------------

resource "random_pet" "this" {
  length = 2
}

module "s3_bucket" {
  source = "../../../../../../../modules/providers/aws/officials/terraform-aws-s3-bucket"

  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = false

  attach_policy = true
  policy        = data.aws_iam_policy_document.bucket_policy.json

  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

  tags = merge(local.tags, local.s3_tags)

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        ## Create New KMS
        # kms_master_key_id = aws_kms_key.objects.arn
        ## Existing CMK ARN
        kms_master_key_id = "${data.aws_kms_key.cmk_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
    rule = {
      default_retention = {
        mode = "GOVERNANCE"
        days = 1
      }
    }
  }

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  # S3 Bucket Ownership Controls
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"
}
