# ==========================================================================
#  Resources: EKS / eks-node-devops.tf (EKS Node Configuration)
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
# NODE GROUP - DEVOPS
#============================================
locals {
  node_selector_devops = "devops"
}

resource "aws_eks_node_group" "devops" {
  ## NODE GROUP
  for_each = toset([
    "monitoring",
    "tools",
  ])

  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "${local.node_selector_devops}-${each.key}_node"
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
    "node"        = "${local.node_selector_devops}-${each.key}"
    "department"  = "devops"
    "productname" = "devopscorner-eks"
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_pair[local.env]
    # source_security_group_ids = [ "${var.vpn_sgid[local.env]}" ]
  }

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 1
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
      Environment     = "DEV"
      Name            = "EKS-1.19-DEVOPS"
      Type            = "PRODUCTS"
      ProductName     = "DEVOPSCORNER-EKS"
      ProductGroup    = "DEV-DEVOPSCORNER-EKS"
      Department      = "DEVOPS"
      DepartmentGroup = "DEV-DEVOPS"
      ResourceGroup   = "DEV-EKS-DEVOPS"
      Services        = "${upper(local.node_selector_devops)}-${upper(each.key)}"
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
resource "aws_autoscaling_schedule" "scale_down_devops_monitoring_dev" {
  autoscaling_group_name = aws_eks_node_group.devops["monitoring"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 0
  min_size               = 0
  recurrence             = "0 13,16 * * *"
  scheduled_action_name  = "scale_down"
  # start_time           = "2022-03-25T13:00:00Z"
}

resource "aws_autoscaling_schedule" "scale_down_devops_tools_dev" {
  autoscaling_group_name = aws_eks_node_group.devops["tools"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 0
  max_size               = 0
  min_size               = 0
  recurrence             = "0 13,16 * * *"
  scheduled_action_name  = "scale_down"
  # start_time           = "2022-03-25T13:00:00Z"
}

## Scale Up
resource "aws_autoscaling_schedule" "scale_up_devops_monitoring_dev" {
  autoscaling_group_name = aws_eks_node_group.devops["monitoring"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 2
  max_size               = 10
  min_size               = 1
  recurrence             = "0 0 * * MON-FRI"
  scheduled_action_name  = "scale_up"
  # start_time           = "2022-03-28T00:00:00Z"
}

resource "aws_autoscaling_schedule" "scale_up_devops_tools_dev" {
  autoscaling_group_name = aws_eks_node_group.devops["tools"].resources[0].autoscaling_groups[0].name
  desired_capacity       = 1
  max_size               = 10
  min_size               = 1
  recurrence             = "0 0 * * MON-FRI"
  scheduled_action_name  = "scale_up"
  # start_time           = "2022-03-28T00:00:00Z"
}

# --------------------------------------------------------------------------
#  Autoscaling Output
# --------------------------------------------------------------------------
## Scale Down ##
output "eks_node_scale_down_devops_monitoring_dev" {
  value = aws_autoscaling_schedule.scale_down_devops_monitoring_dev.arn
}
output "eks_node_scale_down_devops_tools_dev" {
  value = aws_autoscaling_schedule.scale_down_devops_tools_dev.arn
}

## Scale Up ##
output "eks_node_scale_up_devops_monitoring_dev" {
  value = aws_autoscaling_schedule.scale_up_devops_monitoring_dev.arn
}
output "eks_node_scale_up_devops_tools_dev" {
  value = aws_autoscaling_schedule.scale_up_devops_tools_dev.arn
}

# --------------------------------------------------------------------------
#  Node Group Output
# --------------------------------------------------------------------------
## Monitoring Output #
output "eks_node_name_devops_monitoring" {
  value = aws_eks_node_group.devops["monitoring"].id
}

output "eks_node_asg_group_devops_monitoring" {
  value = aws_eks_node_group.devops["monitoring"].resources[0].autoscaling_groups[0].name
}

## Tools Output #
output "eks_node_name_devops_tools" {
  value = aws_eks_node_group.devops["tools"].id
}

output "eks_node_asg_group_devops_tools" {
  value = aws_eks_node_group.devops["tools"].resources[0].autoscaling_groups[0].name
}
