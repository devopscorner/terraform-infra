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
  node_selector_devops = "devopscorner"
}

resource "aws_eks_node_group" "devops" {
  ## NODE GROUP
  for_each = toset([
    "monitoring",
    "tools",
  ])

  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "${local.node_selector_devops}-${each.key}-node"
  node_role_arn   = aws_iam_role.eks_nodes.arn

  ## EKS Private Subnet ###
  subnet_ids = [
    data.terraform_remote_state.core_state.outputs.eks_private_1a[0],
    data.terraform_remote_state.core_state.outputs.eks_private_1b[0],
    data.terraform_remote_state.core_state.outputs.eks_private_1c[0]
  ]

  instance_types = local.env == "prod" ? ["m5.large"] : ["t3.medium"]
  disk_size      = 100
  version        = var.k8s_version[local.env]

  labels = {
    "environment" = "${var.env[local.env]}",
    "node"        = "${local.node_selector_devops}-${each.key}"
    "department"  = "devops"
    "productname" = "devopscorner-${each.key}"
    "service"     = "${each.key}"
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_pair[local.env]
    # source_security_group_ids = [ "${var.vpn_sgid[local.env]}" ]
  }

  scaling_config {
    desired_size = 1
    max_size     = 5
    min_size     = 1
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size,
      scaling_config[0].min_size,
    ]
  }

  tags = merge(
    {
      "ClusterName" = "${var.eks_cluster_name}-${var.env[local.env]}"
      "k8s.io/cluster-autoscaler/${var.eks_cluster_name}-${var.env[local.env]}" = "owned",
      "k8s.io/cluster-autoscaler/enabled" = "true"
      "Terraform" = "true"
    },
    {
      Environment     = "${upper(each.key)}"
      Name            = "EKS-1.22-${upper(local.node_selector_devops)}-${upper(each.key)}"
      Type            = "PRODUCTS"
      ProductName     = "EKS-DEVOPSCORNER"
      ProductGroup    = "${upper(each.key)}-EKS-DEVOPSCORNER"
      Department      = "DEVOPS"
      DepartmentGroup = "${upper(each.key)}-DEVOPS"
      ResourceGroup   = "${upper(each.key)}-EKS-DEVOPSCORNER"
      Services        = "${upper(each.key)}"
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
resource "aws_lb_target_group" "devops" {
  for_each = toset([
    "monitoring",
    "tools"
  ])

  name     = "tg-${local.node_selector_devops}-${each.key}"
  port     = "${each.key}" == "monitoring" ? 30180 : 30280
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  tags = {
    Environment     = "${var.environment[local.env]}"
    Name            = "ALB-${upper(local.node_selector_devops)}-${upper(each.key)}"
    Type            = "PRODUCTS"
    ProductName     = "TG-DEVOPSCORNER"
    ProductGroup    = "${upper(each.key)}-TG-DEVOPSCORNER"
    Department      = "DEVOPS"
    DepartmentGroup = "${upper(each.key)}-DEVOPS"
    ResourceGroup   = "${upper(each.key)}-TG-DEVOPSCORNER"
    Services        = "${upper(local.node_selector_devops)}-${upper(each.key)}"
    Terraform       = true
  }
}

# --------------------------------------------------------------------------
#  Node Group Output
# --------------------------------------------------------------------------
## Monitoring Output #
output "eks_node_name_devops_monitoring" {
  value = aws_eks_node_group.devops["monitoring"].id
}

## Tools Output #
output "eks_node_name_devops_tools" {
  value = aws_eks_node_group.devops["tools"].id
}

# --------------------------------------------------------------------------
#  Target Group Output
# --------------------------------------------------------------------------
## Monitoring TargetGroup Output ##
output "eks_node_tg_devops_monitoring" {
  value = aws_lb_target_group.devops["monitoring"].id
}

## Tools TargetGroup Output ##
output "eks_node_tg_devops_tools" {
  value = aws_lb_target_group.devops["tools"].id
}
