# ==========================================================================
#  Services: ECS GOApp / outputs.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value ec2 module
# ==========================================================================

# ----------------------------------------------
#  Core VPC
# ----------------------------------------------
output "vpc_id" {
  value = data.terraform_remote_state.core_state.outputs.vpc_id
}
output "vpc_cidr" {
  value = data.terraform_remote_state.core_state.outputs.vpc_cidr
}
output "vpc_name" {
  value = data.terraform_remote_state.core_state.outputs.vpc_name
}
output "core_security_group_id" {
  value = data.terraform_remote_state.core_state.outputs.security_group_id
}
output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}

# ----------------------------------------------
#  Core SUBNET
# ----------------------------------------------
# EC2 Private
output "ec2_private_1a" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1a
}
output "ec2_private_1a_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1a_cidr
}
output "ec2_private_1b" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1b
}
output "ec2_private_1b_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1b_cidr
}
output "ec2_private_1c" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1c
}
output "ec2_private_1c_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_private_1c_cidr
}

# EC2 Public
output "ec2_public_1a" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1a
}
output "ec2_public_1a_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1a_cidr
}
output "ec2_public_1b" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1b
}
output "ec2_public_1b_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1b_cidr
}
output "ec2_public_1c" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1c
}
output "ec2_public_1c_cidr" {
  value = data.terraform_remote_state.core_state.outputs.ec2_public_1c_cidr
}

locals {
  summary = <<SUMMARY
VPC Summary:
  VPC Id:                 ${data.terraform_remote_state.core_state.outputs.vpc_id}
  Core Security Group Id: ${data.terraform_remote_state.core_state.outputs.security_group_id}
  ECS Security Group Id:  ${aws_security_group.ecs.id}
Subnet Private:
  EC2 Private 1a:         ${data.terraform_remote_state.core_state.outputs.ec2_private_1a}
  EC2 Private 1b:         ${data.terraform_remote_state.core_state.outputs.ec2_private_1b}
  EC2 Private 1c:         ${data.terraform_remote_state.core_state.outputs.ec2_private_1c}
Subnet Public:
  EC2 Public 1a:          ${data.terraform_remote_state.core_state.outputs.ec2_public_1a}
  EC2 Public 1b:          ${data.terraform_remote_state.core_state.outputs.ec2_public_1b}
  EC2 Public 1c:          ${data.terraform_remote_state.core_state.outputs.ec2_public_1a}
CIDR Block Private:
  EC2 CIDR 1a:            ${aws_subnet.ec2_private_a.cidr_block}
  EC2 CIDR 1b:            ${aws_subnet.ec2_private_b.cidr_block}
  EC2 CIDR 1c:            ${aws_subnet.ec2_private_c.cidr_block}
CIDR Block Public:
  EC2 CIDR 1a:            ${aws_subnet.ec2_public_a.cidr_block}
  EC2 CIDR 1b:            ${aws_subnet.ec2_public_b.cidr_block}
SUMMARY
}

output "summary" {
  value = local.summary
}

