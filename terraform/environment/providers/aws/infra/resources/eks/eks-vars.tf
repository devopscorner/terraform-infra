# ==========================================================================
#  Resources: EKS / eks-vars.tf (Spesific Environment)
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
    staging = "ap-southeast-1b"
    prod    = "ap-southeast-1b"
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

# ------------------------------------
#  DNS (Public)
# ------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    dev     = "ZONE_ID"
    uat     = "ZONE_ID"
    lab     = "ZONE_ID"
    staging = "ZONE_ID"
    prod    = "ZONE_ID"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "awscb.id"
    staging = "awscb.id"
    prod    = "awscb.id"
  }
}

# ------------------------------------
#  EKS Cluster
# ------------------------------------
# PEM File from existing
variable "eks_cluster_name" {
  type        = string
  description = "default cluster name"
  default     = "devopscorner"
}


# ------------------------------------
#  SSH configurations
# ------------------------------------
# PEM File from existing
variable "ssh_key_pair" {
  type        = map(string)
  description = "default keyname"
  default = {
    lab     = "devopscorner-poc"
    staging = "devopscorner-poc"
    prod    = "devopscorner-poc"
  }
}

variable "eks_name_env" {
  type = map(string)
  default = {
    lab     = "lab"
    staging = "staging"
    prod    = "prod"
  }
}

variable "k8s_version" {
  type = map(string)
  default = {
    lab     = "1.23"
    staging = "1.23"
    prod    = "1.23"
  }
}
