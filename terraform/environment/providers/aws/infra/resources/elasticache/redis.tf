# ==========================================================================
#  Resources: Elasticache Redis / redis.tf (Redis Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Resources Tags
#    - Redis Configuration
# ==========================================================================

# --------------------------------------------------------------------------
#  VPC Redis
# --------------------------------------------------------------------------
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.core_state.outputs.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "selected" {
  tags = {
    Name = "devopscorner-sg-ssh-${var.env[local.env]}"
  }
}

##############################################################
# VPN Production SG ID for Remote Access
##############################################################
locals{
  vpn_sgid = "sg-1234567890"
}

##############################################################
# Elasticache Subnet and Cluster Configuration
##############################################################

resource "aws_elasticache_subnet_group" "redis" {
  name       = "devopscorner-redis-cache-subnet"
  subnet_ids = data.aws_subnet_ids.all.ids
  tags = {
    Environment = upper(var.environment)
    ProductCode = var.name
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id         = "devopscorner-redis-cache"
  engine             = "redis"
  node_type          = "cache.t3.micro"
  num_cache_nodes    = "1"
  engine_version     = "6.0.5"
  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [data.aws_security_group.all.ids]
  apply_immediately  = true
  maintenance_window = "mon:20:00-mon:21:00"


  tags = {
    Environment = upper(var.environment)
    ProductCode = var.name
  }
}

# resource "aws_security_group_rule" "allow_traffic_from_lambda_to_redis" {
#   type                     = "ingress"
#   from_port                = 0
#   to_port                  = 0
#   protocol                 = "-1"
#   source_security_group_id = aws_security_group.emsresolver_rds_lambda_sg.id
#   security_group_id        = aws_security_group.redis_instances.id
# }

# resource "aws_security_group" "redis_instances" {
#   name_prefix = "devopscorner-redis-cache-instances-sg"
#   description = "Enable Traffic from Kube to Redis"
#   vpc_id      = data.aws_vpc.zebrax_vpc.id

#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = local.common_tags
# }
