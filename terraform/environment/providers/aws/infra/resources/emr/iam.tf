# ==========================================================================
#  Resources: EMR / iam.tf (IAM Policy)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - IAM Policy for Resources
# ==========================================================================

# ------------------------------------
#  S3 Bucket Policy
# ------------------------------------
resource "aws_iam_role" "this" {
  name = "iam_emr_bucket_role-${var.env[local.env]}"

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

# ------------------------------------
#  EMR IAM Role
# ------------------------------------
resource "aws_iam_role" "iam_emr_service_role" {
  name = "iam_emr_service_role-${var.env[local.env]}"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticmapreduce.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  inline_policy {
    name = "iam_emr_service_policy-admin-${var.env[local.env]}"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
      ## EC2 Full Access ##
        {
            Action = "ec2:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "elasticloadbalancing:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "cloudwatch:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "autoscaling:*"
            Effect = "Allow",
            Resource = "*"
        },
      ## EMR Full Access ##
        {
            Action = [
                "cloudwatch:*",
                "cloudformation:CreateStack",
                "cloudformation:DescribeStackEvents",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:CancelSpotInstanceRequests",
                "ec2:CreateRoute",
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteRoute",
                "ec2:DeleteTags",
                "ec2:DeleteSecurityGroup",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeInstances",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSpotInstanceRequests",
                "ec2:DescribeSpotPriceHistory",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcs",
                "ec2:DescribeRouteTables",
                "ec2:DescribeNetworkAcls",
                "ec2:CreateVpcEndpoint",
                "ec2:ModifyImageAttribute",
                "ec2:ModifyInstanceAttribute",
                "ec2:RequestSpotInstances",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RunInstances",
                "ec2:TerminateInstances",
                "elasticmapreduce:*",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:ListRoles",
                "iam:PassRole",
                "kms:List*",
                "s3:*",
                "sdb:*"
            ],
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "iam:CreateServiceLinkedRole",
            Effect = "Allow",
            Resource = "*",
            Condition = {
                StringLike = {
                    "iam:AWSServiceName": [
                        "elasticmapreduce.amazonaws.com",
                        "elasticmapreduce.amazonaws.com.cn"
                    ]
                }
            }
        },
      ## S3 Full Access ##
        {
            Action = [
                "s3:*",
                "s3-object-lambda:*"
            ],
            Effect = "Allow",
            Resource = "*"
        },
      ## Resource Group & Tags Editor ##
        {
            Action = [
                "tag:getResources",
                "tag:getTagKeys",
                "tag:getTagValues",
                "tag:TagResources",
                "tag:UntagResources",
                "resource-groups:*",
                "cloudformation:DescribeStacks",
                "cloudformation:ListStackResources"
            ],
            Effect = "Allow",
            Resource = "*"
        },
      ## CloudWatch & DynamoDB ##
        {
            Action = [
                "logs:*",
                "dynamodb:DescribeContributorInsights",
                "dynamodb:RestoreTableToPointInTime",
                "dynamodb:UpdateGlobalTable",
                "dynamodb:UpdateTableReplicaAutoScaling",
                "dynamodb:DescribeTable",
                "dynamodb:PartiQLInsert",
                "dynamodb:GetItem",
                "dynamodb:DescribeContinuousBackups",
                "dynamodb:DescribeExport",
                "events:*",
                "dynamodb:EnableKinesisStreamingDestination",
                "dynamodb:BatchGetItem",
                "dynamodb:DisableKinesisStreamingDestination",
                "dynamodb:UpdateTimeToLive",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:PartiQLUpdate",
                "dynamodb:Scan",
                "dynamodb:UpdateItem",
                "dynamodb:UpdateGlobalTableSettings",
                "dynamodb:CreateTable",
                "cloudwatch:*",
                "dynamodb:GetShardIterator",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:ExportTableToPointInTime",
                "dynamodb:DescribeBackup",
                "dynamodb:UpdateTable",
                "dynamodb:GetRecords",
                "dynamodb:DescribeTableReplicaAutoScaling",
                "dynamodb:ListTables",
                "dynamodb:DeleteItem",
                "dynamodb:PurchaseReservedCapacityOfferings",
                "dynamodb:CreateTableReplica",
                "dynamodb:ListTagsOfResource",
                "dynamodb:UpdateContributorInsights",
                "dynamodb:CreateBackup",
                "dynamodb:UpdateContinuousBackups",
                "dynamodb:DescribeReservedCapacityOfferings",
                "dynamodb:TagResource",
                "dynamodb:PartiQLSelect",
                "dynamodb:CreateGlobalTable",
                "dynamodb:DescribeKinesisStreamingDestination",
                "dynamodb:DescribeLimits",
                "dynamodb:ListExports",
                "dynamodb:UntagResource",
                "dynamodb:ConditionCheckItem",
                "dynamodb:ListBackups",
                "dynamodb:Query",
                "dynamodb:DescribeStream",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:ListStreams",
                "dynamodb:ListContributorInsights",
                "dynamodb:DescribeGlobalTableSettings",
                "dynamodb:ListGlobalTables",
                "dynamodb:DescribeGlobalTable",
                "dynamodb:RestoreTableFromBackup",
                "dynamodb:DeleteBackup",
                "dynamodb:PartiQLDelete"
            ],
            Effect = "Allow",
            Resource = "*"
        }
      ] # end Statement
    }) # end jsonencode
  } # end inline_policy
}

resource "aws_iam_role_policy" "iam_emr_service_policy" {
  name = "iam_emr_service_policy-${var.env[local.env]}"
  role = aws_iam_role.iam_emr_service_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Resource": "*",
        "Action": [
            "ec2:AuthorizeSecurityGroupEgress",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CancelSpotInstanceRequests",
            "ec2:CreateNetworkInterface",
            "ec2:CreateSecurityGroup",
            "ec2:CreateTags",
            "ec2:DeleteNetworkInterface",
            "ec2:DeleteSecurityGroup",
            "ec2:DeleteTags",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeDhcpOptions",
            "ec2:DescribeInstanceStatus",
            "ec2:DescribeInstances",
            "ec2:DescribeKeyPairs",
            "ec2:DescribeNetworkAcls",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribePrefixLists",
            "ec2:DescribeRouteTables",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSpotInstanceRequests",
            "ec2:DescribeSpotPriceHistory",
            "ec2:DescribeSubnets",
            "ec2:DescribeVpcAttribute",
            "ec2:DescribeVpcEndpoints",
            "ec2:DescribeVpcEndpointServices",
            "ec2:DescribeVpcs",
            "ec2:DetachNetworkInterface",
            "ec2:ModifyImageAttribute",
            "ec2:ModifyInstanceAttribute",
            "ec2:RequestSpotInstances",
            "ec2:RevokeSecurityGroupEgress",
            "ec2:RunInstances",
            "ec2:TerminateInstances",
            "ec2:DeleteVolume",
            "ec2:DescribeVolumeStatus",
            "ec2:DescribeVolumes",
            "ec2:DetachVolume",
            "iam:GetRole",
            "iam:GetRolePolicy",
            "iam:ListInstanceProfiles",
            "iam:ListRolePolicies",
            "iam:PassRole",
            "s3:CreateBucket",
            "s3:Get*",
            "s3:List*",
            "sdb:BatchPutAttributes",
            "sdb:Select",
            "sqs:CreateQueue",
            "sqs:Delete*",
            "sqs:GetQueue*",
            "sqs:PurgeQueue",
            "sqs:ReceiveMessage"
        ]
    }]
}
EOF
}

# IAM Role for EC2 Instance Profile
resource "aws_iam_role" "iam_emr_profile_role" {
  name = "iam_emr_profile_role-${var.env[local.env]}"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  inline_policy {
    name = "iam_emr_profile_role-s3-${var.env[local.env]}"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
      ## EC2 Full Access ##
        {
            Action = "ec2:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "elasticloadbalancing:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "cloudwatch:*"
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "autoscaling:*"
            Effect = "Allow",
            Resource = "*"
        },
      ## EMR Full Access ##
        {
            Action = [
                "cloudwatch:*",
                "cloudformation:CreateStack",
                "cloudformation:DescribeStackEvents",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:CancelSpotInstanceRequests",
                "ec2:CreateRoute",
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteRoute",
                "ec2:DeleteTags",
                "ec2:DeleteSecurityGroup",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeInstances",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSpotInstanceRequests",
                "ec2:DescribeSpotPriceHistory",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcs",
                "ec2:DescribeRouteTables",
                "ec2:DescribeNetworkAcls",
                "ec2:CreateVpcEndpoint",
                "ec2:ModifyImageAttribute",
                "ec2:ModifyInstanceAttribute",
                "ec2:RequestSpotInstances",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RunInstances",
                "ec2:TerminateInstances",
                "elasticmapreduce:*",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:ListRoles",
                "iam:PassRole",
                "kms:List*",
                "s3:*",
                "sdb:*"
            ],
            Effect = "Allow",
            Resource = "*"
        },
        {
            Action = "iam:CreateServiceLinkedRole",
            Effect = "Allow",
            Resource = "*",
            Condition = {
                StringLike = {
                    "iam:AWSServiceName": [
                        "elasticmapreduce.amazonaws.com",
                        "elasticmapreduce.amazonaws.com.cn"
                    ]
                }
            }
        },
      ## S3 Full Access ##
        {
            Action = [
                "s3:*",
                "s3-object-lambda:*"
            ],
            Effect = "Allow",
            Resource = "*"
        },
      ## Resource Group & Tags Editor ##
        {
            Action = [
                "tag:getResources",
                "tag:getTagKeys",
                "tag:getTagValues",
                "tag:TagResources",
                "tag:UntagResources",
                "resource-groups:*",
                "cloudformation:DescribeStacks",
                "cloudformation:ListStackResources"
            ],
            Effect = "Allow",
            Resource = "*"
        },
      ## CloudWatch & DynamoDB ##
        {
            Action = [
                "logs:*",
                "dynamodb:DescribeContributorInsights",
                "dynamodb:RestoreTableToPointInTime",
                "dynamodb:UpdateGlobalTable",
                "dynamodb:UpdateTableReplicaAutoScaling",
                "dynamodb:DescribeTable",
                "dynamodb:PartiQLInsert",
                "dynamodb:GetItem",
                "dynamodb:DescribeContinuousBackups",
                "dynamodb:DescribeExport",
                "events:*",
                "dynamodb:EnableKinesisStreamingDestination",
                "dynamodb:BatchGetItem",
                "dynamodb:DisableKinesisStreamingDestination",
                "dynamodb:UpdateTimeToLive",
                "dynamodb:BatchWriteItem",
                "dynamodb:PutItem",
                "dynamodb:PartiQLUpdate",
                "dynamodb:Scan",
                "dynamodb:UpdateItem",
                "dynamodb:UpdateGlobalTableSettings",
                "dynamodb:CreateTable",
                "cloudwatch:*",
                "dynamodb:GetShardIterator",
                "dynamodb:DescribeReservedCapacity",
                "dynamodb:ExportTableToPointInTime",
                "dynamodb:DescribeBackup",
                "dynamodb:UpdateTable",
                "dynamodb:GetRecords",
                "dynamodb:DescribeTableReplicaAutoScaling",
                "dynamodb:ListTables",
                "dynamodb:DeleteItem",
                "dynamodb:PurchaseReservedCapacityOfferings",
                "dynamodb:CreateTableReplica",
                "dynamodb:ListTagsOfResource",
                "dynamodb:UpdateContributorInsights",
                "dynamodb:CreateBackup",
                "dynamodb:UpdateContinuousBackups",
                "dynamodb:DescribeReservedCapacityOfferings",
                "dynamodb:TagResource",
                "dynamodb:PartiQLSelect",
                "dynamodb:CreateGlobalTable",
                "dynamodb:DescribeKinesisStreamingDestination",
                "dynamodb:DescribeLimits",
                "dynamodb:ListExports",
                "dynamodb:UntagResource",
                "dynamodb:ConditionCheckItem",
                "dynamodb:ListBackups",
                "dynamodb:Query",
                "dynamodb:DescribeStream",
                "dynamodb:DescribeTimeToLive",
                "dynamodb:ListStreams",
                "dynamodb:ListContributorInsights",
                "dynamodb:DescribeGlobalTableSettings",
                "dynamodb:ListGlobalTables",
                "dynamodb:DescribeGlobalTable",
                "dynamodb:RestoreTableFromBackup",
                "dynamodb:DeleteBackup",
                "dynamodb:PartiQLDelete"
            ],
            Effect = "Allow",
            Resource = "*"
        }
      ] # end Statement
    }) # end jsonencode
  } # end inline_policy
}

resource "aws_iam_instance_profile" "emr_profile" {
  name = "emr_profile-${var.env[local.env]}"
  role = aws_iam_role.iam_emr_profile_role.name
}

resource "aws_iam_role_policy" "iam_emr_profile_policy" {
  name = "iam_emr_profile_policy-${var.env[local.env]}"
  role = aws_iam_role.iam_emr_profile_role.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [{
        "Effect": "Allow",
        "Resource": "*",
        "Action": [
            "cloudwatch:*",
            "dynamodb:*",
            "ec2:Describe*",
            "elasticmapreduce:Describe*",
            "elasticmapreduce:ListBootstrapActions",
            "elasticmapreduce:ListClusters",
            "elasticmapreduce:ListInstanceGroups",
            "elasticmapreduce:ListInstances",
            "elasticmapreduce:ListSteps",
            "kinesis:CreateStream",
            "kinesis:DeleteStream",
            "kinesis:DescribeStream",
            "kinesis:GetRecords",
            "kinesis:GetShardIterator",
            "kinesis:MergeShards",
            "kinesis:PutRecord",
            "kinesis:SplitShard",
            "rds:Describe*",
            "s3:*",
            "sdb:*",
            "sns:*",
            "sqs:*"
        ]
    }]
}
EOF
}
