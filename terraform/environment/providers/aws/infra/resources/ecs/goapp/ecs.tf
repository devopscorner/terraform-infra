# ==========================================================================
#  Resources: ECS GOApp / ecs.tf (ECS Service Configuration)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - VPC References
#    - Route53 Record
#    - Security Group
#    - Bootstrap ECS GoApp
# ==========================================================================

resource "aws_ecs_cluster" "goapp" {
  name               = var.ecs_cluster_name
  capacity_providers = [aws_ecs_capacity_provider.ecs_capacity.name]

  tags = merge(local.tags, local.resources_tags)
}

resource "aws_ecs_capacity_provider" "ecs_capacity" {
  name = "devopscorner-capacity-provider"
  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.asg.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      status          = "ENABLED"
      target_capacity = 85
    }
  }
}

# update file container-def, so it's pulling image from ecr
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                = "web-family"
  container_definitions = file("userdata/container.json")
  network_mode          = "bridge"
  tags = merge(local.tags, local.resources_tags)
}

resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.goapp.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 10

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs["goapp"].arn
    container_name   = "devopscorner-poc-ecs"
    container_port   = 80
  }

  # Optional: Allow external changes without Terraform plan difference(for example ASG)
  lifecycle {
    ignore_changes = [desired_count]
  }
  launch_type = "EC2"
  depends_on  = [aws_lb_listener.goapp]
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/ecs/frontend-container"
  tags = {
    "env"       = "dev"
    "createdBy" = "mkerimova"
  }
}