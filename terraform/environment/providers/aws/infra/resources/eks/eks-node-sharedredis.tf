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
  node_selector_sharedredis = "devopscorner"
}

resource "aws_eks_node_group" "sharedredis" {
  ## NODE GROUP
  for_each = toset([
    "sharedredis"
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
    "productname" = "devopscorner-${each.key}"
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_pair[local.env]
    # source_security_group_ids = [ "${var.vpn_sgid[local.env]}" ]
  }

  scaling_config {
    desired_size = 0
    max_size     = 5
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
      Environment     = "DEV"
      Name            = "EKS-1.22-DEVOPSCORNER-${upper(each.key)}"
      Type            = "PRODUCTS"
      ProductName     = "DEVOPSCORNER-${upper(each.key)}"
      ProductGroup    = "DEV-DEVOPSCORNER--${upper(each.key)}"
      Department      = "DEVOPS"
      DepartmentGroup = "DEV-DEVOPS"
      ResourceGroup   = "DEV-EKS-DEVOPSCORNER"
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

# ------------------------------------
#  Target Group
# ------------------------------------
resource "aws_lb_target_group" "sharedredis" {
  for_each = toset([
    "sharedredis"
  ])

  name     = "devopscorner-tg-${each.key}"
  port     = 31280
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  tags = {
    Environment     = "DEV"
    Name            = "DEVOPSCORNER-TG-${upper(each.key)}"
    Type            = "PRODUCTS"
    ProductName     = "DEVOPSCORNER-TG"
    ProductGroup    = "DEV-DEVOPSCORNER"
    Department      = "DEVOPS"
    DepartmentGroup = "DEV-DEVOPS"
    ResourceGroup   = "DEV-TG-DEVOPSCORNER"
    Services        = "TG-LB"
    Terraform       = true
  }
}

# --------------------------------------------------------------------------
#  Node Group Output
# --------------------------------------------------------------------------
## SharedRedis Output #
output "eks_node_name_sharedredis" {
  value = aws_eks_node_group.sharedredis["sharedredis"].id
}

# --------------------------------------------------------------------------
#  Target Group Output
# --------------------------------------------------------------------------
## SharedRedis Output ##
output "eks_node_tg_sharedredis" {
  value = aws_lb_target_group.sharedredis["sharedredis"].id
}
