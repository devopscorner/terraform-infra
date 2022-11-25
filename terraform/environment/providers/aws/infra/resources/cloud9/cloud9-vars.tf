# ==========================================================================
#  Resources: Cloud9 / cloud9-vars.tf (Spesific Environment)
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
#  S3 Bucket Name
# ------------------------------------
variable "bucket_name" {
  type        = string
  description = "Cloud9 Bucket Name"
  default     = "devopscorner-cloud9"
}

# ------------------------------------
#  Cloud9
# ------------------------------------
variable "cloud9_env" {
  type        = string
  description = "Cloud9 Environment Name"
  default     = "devopscorner-ide"
}

# We choose EFS One Zone Storage for cheaper option
variable "cloud9_efs_az" {
  description = "Cloud9 EFS availability zone"
  type        = map(string)
  default = {
    lab     = "ap-southeast-1a"
    staging = "ap-southeast-1b"
    prod    = "ap-southeast-1b"
  }
}

# Max EC2 spot price
variable "cloud9_spot_price" {
  # https://aws.amazon.com/ec2/spot/pricing/
  # https://docs.aws.amazon.com/powershell/latest/reference/items/Get-EC2SpotPriceHistory.html
  type = string
  # t3.micro  = 0.004
  # t3.small  = 0.0079
  # t3.medium = 0.0158
  # t3.large  = 0.0317
  default = "0.0079"
}

# Type of the EC2 instance you want to launch
variable "cloud9_instance_type" {
  type    = string
  default = "t3.small"
}

# EC2 will fetch and run script on this url after boot
variable "cloud9_user_data_url" {
  type    = string
  default = "https://raw.githubusercontent.com/devopscorner/terraform-infra/main/terraform/environment/providers/aws/infra/resources/cloud9/userdata/user-data.sh"
}

# Used in Security Group for accessing EC2
# You can set the value as environment variable `export TF_VAR_access_my_ip=YOUR_IP/32`
variable "access_my_ip" {
  type        = string
  description = "Your IP Address"
  default     = "118.136.0.0/22"
}

# This ips should be list of AWS Cloud9 IPs according to your selected region
# See https://docs.aws.amazon.com/cloud9/latest/user-guide/ip-ranges.html
# This default uses ap-southeast-1 Cloud9 IP address range
variable "cloud9_ips" {
  type        = list(any)
  description = "Cloud9 IPs Range"
  default     = ["13.250.186.128/27", "13.250.186.160/27"]
}

# Your SSH public key
variable "cloud9_ssh_public_key" {
  type        = string
  description = "SSH Public Key"
  ## file:///Users/[username]/.ssh/id_rsa.pub
  default     = ""
}