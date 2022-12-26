# ==========================================================================
#  Resources: EKS / eks-node-goapp.tf (EKS Node Configuration)
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
# NODE GROUP - GOAPP
#============================================
locals {
  node_selector_goapp = "goapp"
}

resource "aws_eks_node_group" "goapp" {
  ## NODE GROUP
  for_each = (local.env == "prod" ? toset(["prod"]) : toset(["dev", "uat"]))

  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "${local.node_selector_goapp}-${each.key}-node"
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
    "node"        = "${local.node_selector_goapp}-${each.key}"
    "department"  = "softeng"
    "productname" = "devopscorner-${each.key}"
    "service"     = "goapp"
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
      "ClusterName"                                                             = "${var.eks_cluster_name}-${var.env[local.env]}"
      "k8s.io/cluster-autoscaler/${var.eks_cluster_name}-${var.env[local.env]}" = "owned",
      "k8s.io/cluster-autoscaler/enabled"                                       = "true"
      "Terraform"                                                               = "true"
    },
    {
      Environment     = "${upper(each.key)}"
      Name            = "EKS-1.22-${upper(local.node_selector_goapp)}-${upper(each.key)}"
      Type            = "PRODUCTS"
      ProductName     = "EKS-DEVOPSCORNER"
      ProductGroup    = "${upper(each.key)}-EKS-DEVOPSCORNER"
      Department      = "SOFTENG"
      DepartmentGroup = "${upper(each.key)}-SOFTENG"
      ResourceGroup   = "${upper(each.key)}-EKS-DEVOPSCORNER"
      Services        = "${upper(local.node_selector_goapp)}"
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
resource "aws_lb_target_group" "goapp" {
  for_each = (local.env == "prod" ? toset(["prod"]) : toset(["dev", "uat"]))

  name     = "devopscorner-tg-${local.node_selector_goapp}-${each.key}"
  port     = 30080
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.core_state.outputs.vpc_id

  tags = {
    Environment     = "${var.environment[local.env]}"
    Name            = "ALB-${upper(local.node_selector_goapp)}-${upper(each.key)}"
    Type            = "PRODUCTS"
    ProductName     = "TG-DEVOPSCORNER"
    ProductGroup    = "${upper(each.key)}-TG-DEVOPSCORNER"
    Department      = "DEVOPS"
    DepartmentGroup = "${upper(each.key)}-DEVOPS"
    ResourceGroup   = "${upper(each.key)}-TG-DEVOPSCORNER"
    Services        = "${upper(local.node_selector_goapp)}-${upper(each.key)}"
    Terraform       = true
  }
}

# --------------------------------------------------------------------------
#  Node Group Output
# --------------------------------------------------------------------------
## DEV Output ##
output "eks_node_name_goapp_dev" {
  value = aws_eks_node_group.goapp["dev"].id
}

## UAT Output ##
output "eks_node_name_goapp_uat" {
  value = aws_eks_node_group.goapp["uat"].id
}

## PROD Output ##
# output "eks_node_name_goapp_prod" {
#   value = aws_eks_node_group.goapp["prod"].id
# }

# --------------------------------------------------------------------------
#  Target Group Output
# --------------------------------------------------------------------------
## DEV Output ##
output "eks_node_tg_goapp_dev" {
  value = aws_lb_target_group.goapp["dev"].id
}

## UAT Output ##
output "eks_node_tg_goapp_uat" {
  value = aws_lb_target_group.goapp["uat"].id
}

## PROD Output ##
# output "eks_node_tg_goapp_prod" {
#   value = aws_lb_target_group.goapp["prod"].id
# }
