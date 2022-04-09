# ==========================================================================
#  Resources: EKS / eks-node-sharedredis.tf (EKS Node Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - EKS Node Group Name
#    - EKS Version
#    - SSH Key
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - SHAREDREDIS
#============================================
locals {
  node_selector_sharedredis = "sharedredis"
}

resource "aws_eks_node_group" "sharedredis" {
  ## NODE GROUP
  for_each = toset([
    "dev"
  ])

  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "${local.node_selector_sharedredis}-${each.key}_node"
  node_role_arn   = aws_iam_role.eks_nodes.arn

  ## EKS Private Subnet ###
  subnet_ids = [
      data.terraform_remote_state.core_state.outputs.eks_private_1a[0],
      data.terraform_remote_state.core_state.outputs.eks_private_1b[0]
  ]

  instance_types  = ["t3.medium"]
  disk_size       = 100
  version         = "${var.k8s_version[local.env]}"

  labels = {
    "environment" = "staging",
    "node"        = "${local.node_selector_sharedredis}-${each.key}"
    "department"  = "softeng"
    "productname" = "devopscorner-eks"
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_pair[local.env]
    # source_security_group_ids = [ "${var.vpn_sgid[local.env]}" ]
  }

  scaling_config {
    desired_size = 0
    max_size     = 10
    min_size     = 0
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  tags = merge(
    {
      "ClusterName" = "${var.eks_cluster_name}_${var.env[local.env]}"
      "k8s.io/cluster-autoscaler/${var.eks_cluster_name}_${var.env[local.env]}" = "owned",
      "k8s.io/cluster-autoscaler/enabled" = "TRUE"
    },
    {
      Environment     = "${each.key}" == "dev" ? "DEV" : "UAT"
      Name            = "EKS-1.19-SHAREDREDIS"
      Type            = "PRODUCTS"
      ProductName     = "SHAREDREDIS"
      ProductGroup    = "${each.key}" == "dev" ? "DEV-SHAREDREDIS" : "UAT-SHAREDREDIS"
      Department      = "SOFTENG"
      DepartmentGroup = "${each.key}" == "dev" ? "DEV-SOFTENG" : "UAT-SOFTENG"
      ResourceGroup   = "${each.key}" == "dev" ? "DEV-EKS-SHAREDREDIS" : "UAT-EKS-SHAREDREDIS"
      Services        = "REDIS"
    }
  )

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_iam_worker_node_policy,
    aws_iam_role_policy_attachment.eks_iam_cni_policy,
    aws_iam_role_policy_attachment.eks_iam_container_registry_policy,
  ]
}

# --------------------------------------------------------------------------
#  Autoscaling Schedule Node
# --------------------------------------------------------------------------
## Scale Down
resource "aws_autoscaling_schedule" "scale_down_sharedredis_dev" {
  autoscaling_group_name = aws_eks_node_group.sharedredis["dev"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 0
  min_size               = 0
  recurrence             = "0 13,16 * * *"
  scheduled_action_name  = "scale_down"
  # start_time           = "2022-03-25T13:00:00Z"
}

## Scale Up
resource "aws_autoscaling_schedule" "scale_up_sharedredis_dev" {
  autoscaling_group_name = aws_eks_node_group.sharedredis["dev"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 10
  min_size               = 0
  recurrence             = "0 0 * * MON-FRI"
  scheduled_action_name  = "scale_up"
  # start_time           = "2022-03-28T00:00:00Z"
}

# --------------------------------------------------------------------------
#  Autoscaling Output
# --------------------------------------------------------------------------
## Scale Down ##
output "eks_node_scale_down_sharedredis_dev" {
  value = aws_autoscaling_schedule.scale_down_sharedredis_dev.arn
}

## Scale Up ##
output "eks_node_scale_up_sharedredis_dev" {
  value = aws_autoscaling_schedule.scale_up_sharedredis_dev.arn
}

# --------------------------------------------------------------------------
#  Node Group Output
# --------------------------------------------------------------------------
## DEV Output #
output "eks_node_name_sharedredis_dev" {
  value = aws_eks_node_group.sharedredis["dev"].id
}

output "eks_node_asg_group_sharedredis_dev" {
  value = aws_eks_node_group.sharedredis["dev"].resources[0].autoscaling_groups[0].name
}
