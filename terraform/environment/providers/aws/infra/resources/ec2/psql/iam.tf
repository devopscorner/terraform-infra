# ==========================================================================
#  Resources: EC2 PostgreSQL / iam.tf (IAM Policy)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - IAM Policy for Resources
# ==========================================================================

# ------------------------------------
#  S3 Bucket Policy
# ------------------------------------
resource "aws_iam_role" "this" {
  name = "iam_psql_bucket_role-${var.env[local.env]}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.this.arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}",
    ]
  }
}