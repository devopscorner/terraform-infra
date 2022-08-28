# ==========================================================================
#  Resources: EKS / eks-node-spinnaker.tf (EKS Node Configuration)
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
# NODE GROUP - DEVOPS SPINNAKER
#============================================
locals {
  node_selector_spinnaker = "devopscorner"
}

resource "aws_eks_node_group" "spinnaker" {
  ## NODE GROUP
  for_each = toset([
    "spinnaker"
  ])

  cluster_name    = aws_eks_cluster.aws_eks.name
  node_group_name = "${local.node_selector_spinnaker}-${each.key}_node"
  node_role_arn   = aws_iam_role.eks_nodes.arn

  ## EKS Private Subnet ###
  subnet_ids = [
      data.terraform_remote_state.core_state.outputs.eks_private_1a[0],
      data.terraform_remote_state.core_state.outputs.eks_private_1b[0],
      data.terraform_remote_state.core_state.outputs.eks_private_1c[0]
  ]

  instance_types  = ["m5.large"]
  disk_size       = 100
  version         = "${var.k8s_version[local.env]}"

  labels = {
    "environment" = "${var.env[local.env]}",
    "node"        = "${local.node_selector_spinnaker}-${each.key}"
    "department"  = "devops"
    "productname" = "devopscorner-${each.key}"
    "service"     = "${each.key}"
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
      Environment     = "${upper(var.environment[local.env])}"
      Name            = "EKS-1.22-DEVOPSCORNER-${upper(each.key)}"
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
resource "aws_lb_target_group" "spinnaker" {
  for_each = toset([
    "spinnaker"
  ])

  name     = "devopscorner-tg-${each.key}"
  port     = 31380
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
## Spinnaker Output #
output "eks_node_name_spinnaker" {
  value = aws_eks_node_group.spinnaker["spinnaker"].id
}

# --------------------------------------------------------------------------
#  Target Group Output
# --------------------------------------------------------------------------
## Spinnaker Output ##
output "eks_node_tg_spinnaker" {
  value = aws_lb_target_group.spinnaker["spinnaker"].id
}
