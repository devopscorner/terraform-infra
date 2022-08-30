# ==========================================================================
#  Resources: EKS / autoscale-node-devops.tf (EKS Autoscale Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Node VPC Subnet
#    - Node Scaling
#    - Node Tagging
# ==========================================================================

#============================================
# NODE GROUP - DEVOPSCORNER MONITORING & TOOLS
#============================================
locals {
  #for tagging
  Environment_devops      = "STG"
  Name_monitoring         = "EKS-1.22-DEVOPSCORNER-MONITORING"
  Name_tools              = "EKS-1.22-DEVOPSCORNER-TOOLS"
  Type_devops             = "PRODUCTS"
  ProductName_monitoring  = "EKS-DEVOPSCORNER"
  ProductName_tools       = "EKS-DEVOPSCORNER"
  ProductGroup_monitoring = "MONITORING-EKS-DEVOPSCORNER"
  ProductGroup_tools      = "TOOLS-EKS-DEVOPSCORNER"
  Department_devops       = "DEVOPS"
  DepartmentGroup_devops  = "STG-DEVOPS"
  ResourceGroup_devops    = "STG-EKS-DEVOPSCORNER"
  Services_monitoring     = "MONITORING"
  Services_tools          = "TOOLS"
}

# --------------------------------------------------------------------------
#  Autoscaling Tag
# --------------------------------------------------------------------------
# Monitoring
resource "aws_autoscaling_group_tag" "Environment_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Environment"
    value = local.Environment_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Name"
    value = local.Name_monitoring
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Type"
    value = local.Type_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductName"
    value = local.ProductName_monitoring
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductGroup"
    value = local.ProductGroup_monitoring
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Department"
    value = local.Department_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "DepartmentGroup"
    value = local.DepartmentGroup_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ResourceGroup"
    value = local.ResourceGroup_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_devops_monitoring" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["monitoring"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Service"
    value = local.Services_monitoring
    propagate_at_launch = true
  }
}

# Tools
resource "aws_autoscaling_group_tag" "Environment_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Environment"
    value = local.Environment_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Name_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Name"
    value = local.Name_tools
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Type_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Type"
    value = local.Type_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductName_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductName"
    value = local.ProductName_tools
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ProductGroup_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ProductGroup"
    value = local.ProductGroup_tools
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Department_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Department"
    value = local.Department_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "DepartmentGroup_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "DepartmentGroup"
    value = local.DepartmentGroup_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ResourceGroup_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "ResourceGroup"
    value = local.ResourceGroup_devops
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "Services_group_tag_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
    ) : asg.name]
  )
  autoscaling_group_name = each.value
  tag {
    key   = "Service"
    value = local.Services_tools
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group_tag" "ClusterName_group_devops_tools" {
  for_each = toset(
    [for asg in flatten(
      [for resources in aws_eks_node_group.devops["tools"].resources : resources.autoscaling_groups]
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
## Monitoring Output #
output "eks_node_asg_group_devops_monitoring" {
  value = aws_eks_node_group.devops["monitoring"].resources[0].autoscaling_groups[0].name
}

## Tools Output #
output "eks_node_asg_group_devops_tools" {
  value = aws_eks_node_group.devops["tools"].resources[0].autoscaling_groups[0].name
}