# ==========================================================================
#  Core: core-vars.tf (Spesific Environment)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Input Variable for Environment Variables
# ==========================================================================

# ------------------------------------
#  Prefix Infra
# ------------------------------------
variable "coreinfra" {
  type    = string
  default = "devopscorner-tf"
}

# ------------------------------------
#  VPC
# ------------------------------------
variable "vpc_cidr" {
  type = map(string)
  default = {
    lab     = "10.16.0.0/16"
    staging = "10.32.0.0/16"
    prod    = "10.48.0.0/16"
  }
}

variable "vpc_peer"{
  type = map(string)
  default = {
    lab     = "vpc-1234567890"
    staging = "vpc-1234567890"
    prod    = "vpc-0987654321"
  }
}

variable "peer_owner_id"{
  type = map(string)
  default = {
    lab     = "1234567890"
    staging = "1234567890"
    prod    = "0987654321"
  }
}

variable "propagating_vgws"{
  type = map(string)
  default = {
    lab     = "vgw-1234567890"
    staging = "vgw-1234567890"
    prod    = "vgw-0987654321"
  }
}

# variable "vpc_cidr_secondary_a" {
#   type = map(string)
#   default = {
#     lab     = "11.16.0.0/16"
#     staging = "11.32.0.0/16"
#     prod    = "11.48.0.0/16"
#   }
# }

# variable "vpc_cidr_secondary_b" {
#   type = map(string)
#   default = {
#     lab     = "12.16.0.0/16"
#     staging = "12.32.0.0/16"
#     prod    = "12.48.0.0/16"
#   }
# }

# ------------------------------------
#  Infra Prefix
# ------------------------------------
# EC2 Prefix
variable "ec2_prefix" {
  description = "EC2 Prefix Name"
  default     = "ec2"
}

# EKS Prefix
variable "eks_prefix" {
  description = "EKS Prefix Name"
  default     = "eks"
}

# ----------------------------------------------
#  NAT Gateway
# ----------------------------------------------
# NAT EC2 Prefix
variable "nat_ec2_prefix" {
  description = "NAT EC2 Prefix Name"
  default     = "natgw_ec2"
}

# NAT EKS Prefix
variable "nat_eks_prefix" {
  description = "NAT EKS Prefix Name"
  default     = "natgw_eks"
}

# ----------------------------------------------
#  Subnet
# ----------------------------------------------
## EC2 Private
variable "ec2_private_a" {
  type        = map(string)
  description = "Private subnet for EC2 zone 1a"
  default = {
    lab     = "10.16.16.0/21"
    staging = "10.32.16.0/21"
    prod    = "10.48.16.0/21"
  }
}

variable "ec2_private_b" {
  type        = map(string)
  description = "Private subnet for EC2 zone 1b"
  default = {
    lab     = "10.16.24.0/21"
    staging = "10.32.24.0/21"
    prod    = "10.48.24.0/21"
  }
}

variable "ec2_private_c" {
  type        = map(string)
  description = "Private subnet for EC2 zone 1c"
  default = {
    lab     = "10.16.32.0/21"
    staging = "10.32.32.0/21"
    prod    = "10.48.32.0/21"
  }
}

## EC2 Public
variable "ec2_public_a" {
  type        = map(string)
  description = "Public subnet for EC2 zone 1a"
  default = {
    lab     = "10.16.40.0/21"
    staging = "10.32.40.0/21"
    prod    = "10.48.40.0/21"
  }
}

variable "ec2_public_b" {
  type        = map(string)
  description = "Public subnet for EC2 zone 1b"
  default = {
    lab     = "10.16.48.0/21"
    staging = "10.32.48.0/21"
    prod    = "10.48.48.0/21"
  }
}

variable "ec2_public_c" {
  type        = map(string)
  description = "Public subnet for EC2 zone 1c"
  default = {
    lab     = "10.16.56.0/21"
    staging = "10.32.56.0/21"
    prod    = "10.48.56.0/21"
  }
}

## EKS Private
variable "eks_private_a" {
  type        = map(string)
  description = "Private subnet for EKS zone 1a"
  default = {
    lab     = "10.16.64.0/21"
    staging = "10.32.64.0/21"
    prod    = "10.48.64.0/21"
  }
}

variable "eks_private_b" {
  type        = map(string)
  description = "Private subnet for EKS zone 1b"
  default = {
    lab     = "10.16.72.0/21"
    staging = "10.32.72.0/21"
    prod    = "10.48.72.0/21"
  }
}

variable "eks_private_c" {
  type        = map(string)
  description = "Private subnet for EKS zone 1c"
  default = {
    lab     = "10.16.80.0/21"
    staging = "10.32.80.0/21"
    prod    = "10.48.80.0/21"
  }
}

## EKS Public
variable "eks_public_a" {
  type        = map(string)
  description = "Public subnet for EKS zone 1a"
  default = {
    lab     = "10.16.88.0/21"
    staging = "10.32.88.0/21"
    prod    = "10.48.88.0/21"
  }
}

variable "eks_public_b" {
  type        = map(string)
  description = "Public subnet for EKS zone 1b"
  default = {
    lab     = "10.16.96.0/21"
    staging = "10.32.96.0/21"
    prod    = "10.48.96.0/21"
  }
}

variable "eks_public_c" {
  type        = map(string)
  description = "Public subnet for EKS zone 1c"
  default = {
    lab     = "10.16.104.0/21"
    staging = "10.32.104.0/21"
    prod    = "10.48.104.0/21"
  }
}

# ----------------------------------------------
#  Routing Table
# ----------------------------------------------
# EC2 RT Prefix
variable "ec2_rt_prefix" {
  description = "NAT EC2 Routing Table Prefix Name"
  default     = "ec2-rt"
}

# EKS RT Prefix
variable "eks_rt_prefix" {
  description = "NAT EKS Routing Table Prefix Name"
  default     = "eks-rt"
}

# ----------------------------------------------
#  Internet Gateway
# ----------------------------------------------
# IGW Prefix
variable "igw_prefix" {
  description = "IGW Prefix Name"
  default     = "igw"
}

# IGW RT Prefix
variable "igw_rt_prefix" {
  description = "IGW Routing Table Prefix Name"
  default     = "igw-rt"
}

# ----------------------------------------------
#  NAT Gateway
# ----------------------------------------------
# NAT Prefix
variable "nat_prefix" {
  description = "NAT Prefix Name"
  default     = "nat"
}

# NAT RT Prefix
variable "nat_rt_prefix" {
  description = "NAT Routing Table Prefix Name"
  default     = "nat-rt"
}