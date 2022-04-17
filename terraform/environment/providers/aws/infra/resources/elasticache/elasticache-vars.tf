# AWS Provider Variables
variable "region_primary" {
  description = "AWS Region to deploy to"
  default     = "ap-southeast-1"
}

# VPC Variables
variable "vpc_id" {
  description = "Vpc target environment"
}

variable "vpn_sg_id" {
  description = "Security group for VPN Access"
}

variable "subnet_selected_tag" {
  description = "Default subnet selection for aws cache"
}

variable "sg_selected_tag" {
  description = "Default sg selection for aws cache"
}

# Elasticache Variables
variable "subnet_group_name" {
  description = "Elasticache subnet group name"
}

variable "cluster_name" {
  description = "Elastic cache cluster id / name"
}

variable "cluster_engine" {
  description = "Cluster engine. redis / memcached"
}

variable "cluster_engine_version" {
  description = "Cluster engine version"
}

variable "cluster_node_type" {
  description = "Cluster node type selection"
}

variable "cluster_node_num" {
  description = "Minimum cluster node to run"
}

variable "cluster_maintenance" {
  description = "Maintenance window schedule for the cluster"
  default = "sun:05:00-sun:09:00"
}

# Tag Variables
variable "environment" {
  description = "Target Environment"
}

variable "department" {
  description = "Department Owner"
}

variable "product_type" {
  description = "Product Type"
}

variable "product_name" {
  description = "Product Name"
}

variable "product_name" {
  description = "Service Name. REDIS-ELASTICACHE / MEMCACHED-ELASTICACHE"
}