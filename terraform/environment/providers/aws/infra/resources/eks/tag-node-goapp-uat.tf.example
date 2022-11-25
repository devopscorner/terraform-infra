# ==========================================================================
#  Resources: EKS / autoscale-node-goapp-uat.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - GOAPP - UAT
#============================================
locals {
  #for tagging
  Environment_goapp_uat     = "UAT"
  Name_goapp_uat            = "EKS-1.22-GOAPP-UAT"
  Type_goapp_uat            = "PROJECTS"
  ProductName_goapp_uat     = "EKS-DEVOPSCORNER"
  ProductGroup_goapp_uat    = "UAT-EKS-DEVOPSCORNER"
  Department_goapp_uat      = "SOFTENG"
  DepartmentGroup_goapp_uat = "UAT-SOFTENG"
  ResourceGroup_goapp_uat   = "UAT-EKS-DEVOPSCORNER"
  Services_goapp_uat        = "GOAPP"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
resource "aws_autoscaling_group_tag" "Environment_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Environment"
    value               = local.Environment_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Name"
    value               = local.Name_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Type"
    value               = local.Type_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductName"
    value               = local.ProductName_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ProductGroup"
    value               = local.ProductGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Department"
    value               = local.Department_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "DepartmentGroup"
    value               = local.DepartmentGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "ResourceGroup"
    value               = local.ResourceGroup_goapp_uat
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_goapp_uat" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.goapp["uat"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key                 = "Service"
    value               = local.Services_goapp_uat
    propagate_at_launch = true
  }
}

# --------------------------------------------------------------------------
#  Autoscaling Node Group Output
# --------------------------------------------------------------------------
output "eks_node_asg_group_goapp_uat" {
  value = aws_eks_node_group.goapp["uat"].resources[0].autoscaling_groups[0].name
}
