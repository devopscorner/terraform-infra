# ==========================================================================
#  Resources: ECS GOApp / ecs-goapp-vars.tf (Spesific Environment)
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
#  DNS (Public)
# ------------------------------------
variable "dns_zone" {
  type = map(string)
  default = {
    lab     = "Z03737373Q24J54C2PDT7"
    staging = "Z03737373Q24J54C2PDT7"
    prod    = "Z03737373Q24J54C2PDT7"
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
#  S3 Bucket Name
# ------------------------------------
variable "bucket_name" {
  type        = string
  description = "Bucket Name"
  default     = "devopscorner-ecs"
}

# ------------------------------------
#  ECS Cluster
# ------------------------------------
variable "ecs_cluster_name" {
  type        = string
  description = "default cluster name"
  default     = "devopscorner-goapp"
}

# ------------------------------------
#  ECS
# ------------------------------------
variable "ec2_name" {
  type        = string
  description = "ECS Name"
  default     = "ecs"
}

variable "ec2_type" {
  type        = map(string)
  description = "ECS EC2 Instance Type"
  default = {
    lab     = "t3.small"
    staging = "t3.small"
    prod    = "t3.small"
  }
}

variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "118.136.0.0/22"
}

# ------------------------------------
#  SSH public key
# ------------------------------------
#
variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
  ## file:///Users/[username]/.ssh/id_rsa.pub
  default     = "devopscorner-deploy-poc"
}

# ------------------------------------
#  AMI Linux
# ------------------------------------
variable "ami_os" {
   type        = string
   description = "Selected OS AMI"
   ### AWS Linux ###
   # default   = "aws-linux"
   ### Ubuntu ###
   default     = "ubuntu"
}

variable "ami_aws_linux" {
   type        = string
   description = "AWS Linux AMI to use.  Must match availability zone, instance type, etc"
   ### AWS Linux ###
   default     = "ami-0dc5785603ad4ff54"
}

variable "ami_ubuntu" {
   type        = string
   description = "Ubuntu Linux AMI to use.  Must match availability zone, instance type, etc"
   ### Ubuntu ###
   default     = "ami-0fed77069cd5a6d6c"
}
