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
variable "region" {
  type        = map(string)
  description = "AWS Zone Target Deployment"
  default = {
    lab     = "ap-southeast-1"
    staging = "ap-southeast-1"
    prod    = "ap-southeast-1"
  }
}

# ------------------------------------
#  EC2 Instance
# ------------------------------------
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "118.136.0.0/16"
}

# ------------------------------------
#  DNS (Public)
# ------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    dev     = "ZONE-ID-DEV"
    uat     = "ZONE-ID-UAT"
    lab     = "ZONE-ID-LAB"
    staging = "ZONE-ID-STAGING"
    prod    = "ZONE-ID-PROD"
  }
}

variable "dns_url" {
  type = map(string)
  default = {
    lab     = "devopscorner.lab"
    staging = "devopscorner.staging"
    prod    = "devopscorner.id"
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
    lab     = "devopscorner-deploy-lab"
    staging = "devopscorner-deploy-staging"
    prod    = "devopscorner-deploy-prod"
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
    lab     = "1.19"
    staging = "1.19"
    prod    = "1.19"
  }
}