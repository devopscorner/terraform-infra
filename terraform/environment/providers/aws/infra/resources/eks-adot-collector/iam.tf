# ==========================================================================
#  Resources: EKS-ADOT / iam.tf (IAM Policy)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - IAM Policy for Resources
# ==========================================================================

resource "aws_iam_role" "adot_collector" {
  name = "adot-collector"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "adot_collector_prometheus" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
  role       = aws_iam_role.adot_collector.name
}

resource "aws_iam_role_policy_attachment" "adot_collector_xray" {
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
  role       = aws_iam_role.adot_collector.name
}

resource "aws_iam_role_policy_attachment" "adot_collector_cloudwatch" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.adot_collector.name
}

resource "aws_iam_role_policy_attachment" "adot_collector_cloudwatch_logs" {
  policy_arn = "arn:aws:iam::aws:policy/AWSOpsWorksCloudWatchLogs"
  role       = aws_iam_role.adot_collector.name
}
