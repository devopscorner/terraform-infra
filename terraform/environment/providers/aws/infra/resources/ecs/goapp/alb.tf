# ==========================================================================
#  Resources: ECS GOApp / alb.tf (Application LoadBalancer)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - ALB Tags
#    - ALB Listener (Port, Protocol)
#    - ALB Healthcheck
# ==========================================================================

# --------------------------------------------------------------------------
#  Resources Tags
# --------------------------------------------------------------------------
locals {
  alb_tags = {
    Name          = "${var.ec2_name}-alb-${var.env[local.env]}",
    ResourceGroup = "${var.environment[local.env]}-ALB-ECS"
  }
}

resource "aws_lb" "ecs_alb" {
  name               = "${var.ec2_name}-alb-${var.env[local.env]}"
  load_balancer_type = "application"
  internal           = false
  subnets = [
    ## Public Subnet
    data.terraform_remote_state.core_state.outputs.ec2_public_1a[0],
    data.terraform_remote_state.core_state.outputs.ec2_public_1b[0],
    data.terraform_remote_state.core_state.outputs.ec2_public_1c[0]
  ]
  security_groups = ["${aws_security_group.ecs.id}"]
  tags = merge(local.tags, local.alb_tags)
}

# ------------------------------------
#  Target Group
# ------------------------------------
resource "aws_lb_target_group" "ecs" {
  for_each = toset([
    "goapp",
  ])

  name     = "devopscorner-tg-${each.key}"
  port     = "${each.key}" == "goapp" ? 30180 : 30280
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  tags = {
    Environment     = "${var.environment[local.env]}"
    Name            = "ALB-${upper(each.key)}"
    Type            = "PRODUCTS"
    ProductName     = "TG-DEVOPSCORNER"
    ProductGroup    = "${upper(each.key)}-TG-DEVOPSCORNER"
    Department      = "DEVOPS"
    DepartmentGroup = "${upper(each.key)}-DEVOPS"
    ResourceGroup   = "${upper(each.key)}-TG-DEVOPSCORNER"
    Services        = "${upper(each.key)}"
    Terraform       = true
  }
}

resource "aws_lb_listener" "goapp" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs.arn
  }
}