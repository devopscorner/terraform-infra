# ==========================================================================
#  Resources: RDS / rds-vars.tf (Spesific Environment)
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
#  DNS (Private)
# ------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    lab     = "ZONE_ID"
    staging = "ZONE_ID"
    prod    = "ZONE_ID"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "devopscorner.online"
    staging = "devopscorner.online"
    prod    = "devopscorner.online"
  }
}

# ------------------------------------
#  RDS
# ------------------------------------
variable "db_instance_class" {
  type = map(string)
  default = {
    lab     = "db.t3.small"
    staging = "db.t3.medium"
    prod    = "db.t3.large"
  }
}

variable "retention_db" {
  type = map(number)
  default = {
    lab     = 3
    staging = 3
    prod    = 7
  }
}

variable "vpc_list" {
  type = list(string)
  ## VPC Lab, Staging, Prod
  default = {
    lab     = "vpc-1234567890"
    staging = "vpc-1234567890"
    prod    = "vpc-0987654321"
  }
}

variable "rds_name" {
  type        = string
  description = "RDS Name"
  default     = "GOAPPDB-PSQL"
}

variable "rds_storage_size" {
  type = map(number)
  default = {
    lab     = 50
    staging = 100
    prod    = 100
  }
}

variable "rds_engine" {
  type        = string
  description = "RDS Engine DBMS"
  default     = "postgres"
}

variable "rds_version" {
  type        = string
  description = "RDS Version DBMS"
  default     = "14.1"
}

variable "rds_family" {
  type        = string
  description = "RDS Family Version DBMS"
  default     = "postgres14"
}

variable "rds_major_engine_version" {
  type        = string
  description = "RDS Initial Version DBMS"
  default     = "14"
}

variable "vpc_tags" {
  type = map(any)
  default = {
    lab = {
      Environment     = "LAB"
      Name            = "devopscorner-terraform-lab-vpc"
      Department      = "DEVOPS"
      DepartmentGroup = "LAB-DEVOPS"
      ResourceGroup   = "LAB-VPC"
    }
    staging = {
      Environment     = "STAGING"
      Name            = "devopscorner-terraform-staging-vpc"
      Department      = "DEVOPS"
      DepartmentGroup = "STG-DEVOPS"
      ResourceGroup   = "STG-VPC"
    }
    prod = {
      Environment     = "PROD"
      Name            = "devopscorner-terraform-prod-vpc"
      Department      = "DEVOPS"
      DepartmentGroup = "PROD-DEVOPS"
      ResourceGroup   = "PROD-VPC"
    }
  }
}