# ==========================================================================
#  Core: output.tf (Output Terraform)
# --------------------------------------------------------------------------
#  Description
# --------------------------------------------------------------------------
#    - Return value terraform module
# ==========================================================================

output "vpc_id" {
  value = aws_vpc.infra_vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.infra_vpc.cidr_block
}
output "vpc_name" {
  value = local.vps_tags.Name
}
output "security_group_id" {
  value = aws_security_group.default.id
}

# ----------------------------------------------
#  EC2 Output
# ----------------------------------------------
# EC2 Private
output "ec2_private_1a" {
  value = aws_subnet.ec2_private_a.*.id
}
output "ec2_private_1a_cidr" {
  value = aws_subnet.ec2_private_a.cidr_block
}
output "ec2_private_1b" {
  value = aws_subnet.ec2_private_b.*.id
}
output "ec2_private_1b_cidr" {
  value = aws_subnet.ec2_private_b.cidr_block
}
output "ec2_private_1c" {
  value = aws_subnet.ec2_private_c.*.id
}
output "ec2_private_1c_cidr" {
  value = aws_subnet.ec2_private_c.cidr_block
}

# EC2 Public
output "ec2_public_1a" {
  value = aws_subnet.ec2_public_a.*.id
}
output "ec2_public_1a_cidr" {
  value = aws_subnet.ec2_public_a.cidr_block
}
output "ec2_public_1b" {
  value = aws_subnet.ec2_public_b.*.id
}
output "ec2_public_1b_cidr" {
  value = aws_subnet.ec2_public_b.cidr_block
}
output "ec2_public_1c" {
  value = aws_subnet.ec2_public_c.*.id
}
output "ec2_public_1c_cidr" {
  value = aws_subnet.ec2_public_c.cidr_block
}

# ----------------------------------------------
#  EKS Output
# ----------------------------------------------
# EKS Private
output "eks_private_1a" {
  value = aws_subnet.eks_private_a.*.id
}
output "eks_private_1a_cidr" {
  value = aws_subnet.eks_private_a.cidr_block
}
output "eks_private_1b" {
  value = aws_subnet.eks_private_b.*.id
}
output "eks_private_1b_cidr" {
  value = aws_subnet.eks_private_b.cidr_block
}
output "eks_private_1c" {
  value = aws_subnet.eks_private_c.*.id
}
output "eks_private_1c_cidr" {
  value = aws_subnet.eks_private_c.cidr_block
}

# EKS Public
output "eks_public_1a" {
  value = aws_subnet.eks_public_a.*.id
}
output "eks_public_1a_cidr" {
  value = aws_subnet.eks_public_a.cidr_block
}
output "eks_public_1b" {
  value = aws_subnet.eks_public_b.*.id
}
output "eks_public_1b_cidr" {
  value = aws_subnet.eks_public_b.cidr_block
}
output "eks_public_1c" {
  value = aws_subnet.eks_public_c.*.id
}
output "eks_public_1c_cidr" {
  value = aws_subnet.eks_public_c.cidr_block
}

locals {
  summary = <<SUMMARY
VPC Summary:
  VPC Id:            ${aws_vpc.infra_vpc.id}
  Security Group Id: ${aws_security_group.default.id}
Subnet Private:
  EC2 Private 1a:    ${aws_subnet.ec2_private_a.id}
  EC2 Private 1b:    ${aws_subnet.ec2_private_b.id}
  EC2 Private 1c:    ${aws_subnet.ec2_private_c.id}
  EKS Private 1a:    ${aws_subnet.eks_private_a.id}
  EKS Private 1b:    ${aws_subnet.eks_private_b.id}
  EKS Private 1c:    ${aws_subnet.eks_private_c.id}
Subnet Public:
  EC2 Public 1a:     ${aws_subnet.ec2_public_a.id}
  EC2 Public 1b:     ${aws_subnet.ec2_public_b.id}
  EC2 Public 1c:     ${aws_subnet.ec2_public_c.id}
  EKS Public 1a:     ${aws_subnet.eks_public_a.id}
  EKS Public 1b:     ${aws_subnet.eks_public_b.id}
  EKS Public 1c:     ${aws_subnet.eks_public_c.id}
CIDR Block Private:
  EC2 CIDR 1a:       ${aws_subnet.ec2_private_a.cidr_block}
  EC2 CIDR 1b:       ${aws_subnet.ec2_private_b.cidr_block}
  EC2 CIDR 1c:       ${aws_subnet.ec2_private_c.cidr_block}
  EKS CIDR 1a:       ${aws_subnet.eks_private_a.cidr_block}
  EKS CIDR 1b:       ${aws_subnet.eks_private_b.cidr_block}
  EKS CIDR 1c:       ${aws_subnet.eks_private_c.cidr_block}
CIDR Block Public:
  EC2 CIDR 1a:       ${aws_subnet.ec2_public_a.cidr_block}
  EC2 CIDR 1b:       ${aws_subnet.ec2_public_b.cidr_block}
  EC2 CIDR 1c:       ${aws_subnet.ec2_public_c.cidr_block}
  EKS CIDR 1a:       ${aws_subnet.eks_public_a.cidr_block}
  EKS CIDR 1b:       ${aws_subnet.eks_public_b.cidr_block}
  EKS CIDR 1c:       ${aws_subnet.eks_public_c.cidr_block}
SUMMARY
}

output "summary" {
  value = local.summary
}
