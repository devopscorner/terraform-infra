# ==========================================================================
#  Resources: EKS / autoscale-node-spinnaker.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - DEVOPSCORNER SPINNAKER
#============================================
locals {
  #for tagging
  Environment_spinnaker     = "STG"
  Name_spinnaker            = "EKS-1.22-DEVOPSCORNER-SPINNAKER"
  Type_spinnaker            = "PRODUCTS"
  ProductName_spinnaker     = "EKS-DEVOPSCORNER"
  ProductGroup_spinnaker    = "SPINNAKER-EKS-DEVOPSCORNER"
  Department_spinnaker      = "DEVOPS"
  DepartmentGroup_spinnaker = "SPINNAKER-DEVOPS"
  ResourceGroup_spinnaker   = "SPINNAKER-EKS-DEVOPSCORNER"
  Services_spinnaker        = "SPINNAKER"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
resource "aws_autoscaling_group_tag" "Environment_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Environment"
    value = local.Environment_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Name"
    value = local.Name_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Type"
    value = local.Type_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductName"
    value = local.ProductName_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductGroup"
    value = local.ProductGroup_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Department"
    value = local.Department_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "DepartmentGroup"
    value = local.DepartmentGroup_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ResourceGroup"
    value = local.ResourceGroup_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Service"
    value = local.Services_spinnaker
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ClusterName_group_tag_spinnaker" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.spinnaker["spinnaker"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ClusterName"
    value = "${var.eks_cluster_name}"
    propagate_at_launch = true
  }
}

# --------------------------------------------------------------------------
#  Autoscaling Node Group Output
# --------------------------------------------------------------------------
output "eks_node_asg_group_spinnaker" {
  value = aws_eks_node_group.spinnaker["spinnaker"].resources[0].autoscaling_groups[0].name
}
