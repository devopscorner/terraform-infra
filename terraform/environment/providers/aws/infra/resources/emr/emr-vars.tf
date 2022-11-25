# ==========================================================================
#  Resources: EMR / emr-vars.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# ------------------------------------
#  AWS Zone
# ------------------------------------
variable "aws_az" {
  type        = map(string)
  description = "AWS Zone Target Deployment"
  default = {
    lab     = "ap-southeast-1a"
    staging = "ap-southeast-1a"
    prod    = "ap-southeast-1a"
  }
}

# ------------------------------------
#  EC2 Instance
# ------------------------------------
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "118.136.0.0/22"
}

# ========================================
# EMR general configurations
# ========================================
variable "release_label" {
  description = "default release version number"
  type        = string
  default     = "emr-6.2.1"
}

variable "applications" {
  description = "default application bucket name"
  type        = list
  default     = [ "Hadoop", "Spark", "Hive", "Hue" ]
}

# ------------------------------------
#  EC2 configurations
# ------------------------------------
# PEM File from existing
variable "key_name" {
  type        = map(string)
  description = "default keyname"
  default = {
    lab     = "pem-deploy-lab"
    staging = "pem-deploy-staging"
    prod    = "pem-deploy-prod"
  }
}

# ------------------------------------
#  Security Group
# ------------------------------------
variable "sg_master_name" {
  type        = string
  description = "Security Group Master Name"
  default     = "emr_master"
}

variable "sg_slave_name" {
  type        = string
  description = "Security Group Slave Name"
  default     = "emr_slave"
}

variable "sg_service_access_name" {
  type        = string
  description = "Security Group Service Access Group Id"
  default     = "emr_service_access"
}

# ========================================
#  EMR managed autoscale configurations
# ========================================
variable "autoscale_unit_type" {
  description = "autoscale unit type limits"
  type        = string
  default     = "InstanceFleetUnits"
}

variable "autoscale_min_capacity_units" {
  description = "autoscale minimum capacity units"
  type        = number
  default     = 8
}

variable "autoscale_max_capacity_units" {
  description = "autoscale minimum capacity units"
  type        = number
  default     = 32
}

variable "autoscale_max_ondemand_capacity_units" {
  description = "autoscale maximum ondemand capacity units"
  type        = number
  default     = 4
}

variable "autoscale_max_core_capacity_units" {
  description = "autoscale maximum core capacity units"
  type        = number
  default     = 4
}


#########################
## EMR Cluster         ##
#########################
variable "ebs_root_volume_size" {
  description = "default number of ebs size (GB)"
  type        = number
  default     = 50
}

## Instant Role (Existing)
# variable "role_arn" {
#   description = "default arn assume role"
#   type        = string
#   default     = "arn:aws:iam::YOUR_AWS_KEY:role/user-admin"
# }

# variable "service_role" {
#   description = "default service role arn"
#   type        = string
#   default     = "arn:aws:iam::YOUR_AWS_KEY:role/devopscorner-managed-emr-service-role"
# }

# variable "instance_profile" {
#   description = "default arn instance profile"
#   type        = string
#   default     = "arn:aws:iam::YOUR_AWS_KEY:instance-profile/devopscorner-managed-ec2-profile-role"
# }

###########################
## Master Instance Fleet ##
###########################
variable "master_target_ondemand_capacity" {
  description = "default capacity demand"
  type        = number
  default     = 1
}

variable "master_spot_capacity" {
  description = "default spot capacity"
  type        = number
  default     = 0
}

variable "master_allocation" {
  description = "default allocation strategy"
  type        = string
  default     = "lowest-price"
}

variable "master_ebs_volume_size" {
  description = "default number of ebs size (GB)"
  type        = number
  default     = 50
}

variable "master_ebs_number" {
  description = "default number volume per-instance"
  type        = number
  default     = 2
}

variable "master_weight_capacity" {
  description = "default weight capacity"    ## Number of Instances
  type        = number
  default     = 1
}

variable "master_instance_type" {
  description = "default ec2 instance type for master fleet"
  type        = string
  default     = "m6g.xlarge"
}

#########################
## Core Instance Fleet ##
#########################
variable "core_target_ondemand_capacity" {
  description = "default capacity demand"
  type        = number
  default     = 4
}

variable "core_spot_capacity" {
  description = "default spot capacity"
  type        = number
  default     = 0
}

variable "core_allocation" {
  description = "default allocation strategy"
  type        = string
  default     = "lowest-price"
}

variable "core_ebs_volume_size" {
  description = "default number of ebs size (GB)"
  type        = number
  default     = 50
}

variable "core_ebs_number" {
  description = "default number volume per-instance"
  type        = number
  default     = 2
}

variable "core_weight_capacity" {
  description = "default weight capacity"    ## Number of Core
  type        = number
  default     = 4
}

variable "core_instance_type" {
  description = "default ec2 instance type for core fleet"
  type        = string
  default     = "m6g.xlarge"
}

########################
## Task Instance Fleet #
########################
variable "task_target_ondemand_capacity" {
  description = "default capacity demand"
  type        = number
  default     = 0
}

variable "task_spot_capacity" {
  description = "default spot capacity"
  type        = number
  default     = 4
}

variable "task_allocation" {
  description = "default allocation strategy"
  type        = string
  default     = "lowest-price"
}

variable "task_ebs_volume_size" {
  description = "default number of ebs size (GB)"
  type        = number
  default     = 25
}

variable "task_ebs_number" {
  description = "default number volume per-instance"
  type        = number
  default     = 2
}

variable "task_instance_type_xlarge" {
  description = "default ec2 instance type for xlarge"
  type        = string
  default     = "m6g.xlarge"
}

variable "task_instance_type_2xlarge" {
  description = "default ec2 instance type for 2xlarge"
  type        = string
  default     = "m6g.2xlarge"
}

variable "task_instance_type_4xlarge" {
  description = "default ec2 instance type for 4xlarge"
  type        = string
  default     = "m6g.4xlarge"
}

variable "task_weight_capacity_xlarge" {
  description = "default weight capacity"    ## Number of Core
  type        = number
  default     = 4
}

variable "task_weight_capacity_2xlarge" {
  description = "default weight capacity"    ## Number of Core
  type        = number
  default     = 8
}

variable "task_weight_capacity_4xlarge" {
  description = "default weight capacity"    ## Number of Core
  type        = number
  default     = 16
}

variable "task_bid_price" {
  description = "default bidding price"
  type        = number
  default     = 100
}
