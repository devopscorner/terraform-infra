# ==========================================================================
#  Resources: EKS / autoscale-node-sharedredis.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - DEVOPSCORNER SHAREDREDIS
#============================================
locals {
  #for tagging
  Environment_sharedredis     = "STG"
  Name_sharedredis            = "EKS-1.22-DEVOPSCORNER-SHAREDREDIS"
  Type_sharedredis            = "PRODUCTS"
  ProductName_sharedredis     = "EKS-DEVOPSCORNER"
  ProductGroup_sharedredis    = "SHAREDREDIS-EKS-DEVOPSCORNER"
  Department_sharedredis      = "DEVOPS"
  DepartmentGroup_sharedredis = "SHAREDREDIS-DEVOPS"
  ResourceGroup_sharedredis   = "SHAREDREDIS-EKS-DEVOPSCORNER"
  Services_sharedredis        = "SHAREDREDIS"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
resource "aws_autoscaling_group_tag" "Environment_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Environment"
    value = local.Environment_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Name"
    value = local.Name_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Type"
    value = local.Type_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductName"
    value = local.ProductName_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductGroup"
    value = local.ProductGroup_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Department"
    value = local.Department_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "DepartmentGroup"
    value = local.DepartmentGroup_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ResourceGroup"
    value = local.ResourceGroup_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Service"
    value = local.Services_sharedredis
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ClusterName_group_tag_sharedredis" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.sharedredis["sharedredis"].resources : resources.autoscaling_groups]
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
output "eks_node_asg_group_sharedredis" {
  value = aws_eks_node_group.sharedredis["sharedredis"].resources[0].autoscaling_groups[0].name
}
