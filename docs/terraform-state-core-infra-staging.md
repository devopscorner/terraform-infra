## Output

```json
terraform output
-----
ec2_private_1a = [
  "subnet-0c4bc8828fa3cf04a",
]
ec2_private_1a_cidr = "10.32.16.0/21"
ec2_private_1b = [
  "subnet-08be7507c2e00dedd",
]
ec2_private_1b_cidr = "10.32.24.0/21"
ec2_private_1c = [
  "subnet-07d6efe20a9079a36",
]
ec2_private_1c_cidr = "10.32.32.0/21"
ec2_public_1a = [
  "subnet-02ddb146bdbfb57e9",
]
ec2_public_1a_cidr = "10.32.40.0/21"
ec2_public_1b = [
  "subnet-0fb2c4d1be62fa4e7",
]
ec2_public_1b_cidr = "10.32.48.0/21"
ec2_public_1c = [
  "subnet-08f3fa4c78450ceb7",
]
ec2_public_1c_cidr = "10.32.56.0/21"
eks_private_1a = [
  "subnet-0a97981b2a6cd223f",
]
eks_private_1a_cidr = "10.32.64.0/21"
eks_private_1b = [
  "subnet-0fbaa45870d7b22d0",
]
eks_private_1b_cidr = "10.32.72.0/21"
eks_private_1c = [
  "subnet-0400078d32471fdc9",
]
eks_private_1c_cidr = "10.32.80.0/21"
eks_public_1a = [
  "subnet-0c8fc46d79a4a0b90",
]
eks_public_1a_cidr = "10.32.88.0/21"
eks_public_1b = [
  "subnet-041d59b624c13d061",
]
eks_public_1b_cidr = "10.32.96.0/21"
eks_public_1c = [
  "subnet-0f92d413a82bccbd9",
]
eks_public_1c_cidr = "10.32.104.0/21"
security_group_id = "sg-0fc4713aeb23c8ee6"
summary = <<EOT
VPC Summary:
  VPC Id:            vpc-074d5cb113db55d7e
  Security Group Id: sg-0fc4713aeb23c8ee6
Subnet Private:
  EC2 Private 1a:    subnet-0c4bc8828fa3cf04a
  EC2 Private 1b:    subnet-08be7507c2e00dedd
  EC2 Private 1c:    subnet-07d6efe20a9079a36
  EKS Private 1a:    subnet-0a97981b2a6cd223f
  EKS Private 1b:    subnet-0fbaa45870d7b22d0
  EKS Private 1c:    subnet-0400078d32471fdc9
Subnet Public:
  EC2 Public 1a:     subnet-02ddb146bdbfb57e9
  EC2 Public 1b:     subnet-0fb2c4d1be62fa4e7
  EC2 Public 1c:     subnet-08f3fa4c78450ceb7
  EKS Public 1a:     subnet-0c8fc46d79a4a0b90
  EKS Public 1b:     subnet-041d59b624c13d061
  EKS Public 1c:     subnet-0f92d413a82bccbd9
CIDR Block Private:
  EC2 CIDR 1a:       10.32.16.0/21
  EC2 CIDR 1b:       10.32.24.0/21
  EC2 CIDR 1c:       10.32.32.0/21
  EKS CIDR 1a:       10.32.64.0/21
  EKS CIDR 1b:       10.32.72.0/21
  EKS CIDR 1c:       10.32.80.0/21
CIDR Block Public:
  EC2 CIDR 1a:       10.32.40.0/21
  EC2 CIDR 1b:       10.32.48.0/21
  EKS CIDR 1a:       10.32.88.0/21
  EKS CIDR 1b:       10.32.96.0/21
  EKS CIDR 1c:       10.32.104.0/21

EOT
vpc_cidr = "10.32.0.0/16"
vpc_id = "vpc-074d5cb113db55d7e"
vpc_name = "devopscorner-tf-staging-vpc"
```

## State List

```json
terraform state list
-----
aws_eip.ec2
aws_eip.eks
aws_internet_gateway.igw
aws_nat_gateway.ec2_ngw
aws_nat_gateway.eks_ngw
aws_route_table.igw_ec2_rt_public_a
aws_route_table.igw_ec2_rt_public_b
aws_route_table.igw_ec2_rt_public_c
aws_route_table.igw_eks_rt_public_a
aws_route_table.igw_eks_rt_public_b
aws_route_table.igw_eks_rt_public_c
aws_route_table.nat_ec2_rt_private_a
aws_route_table.nat_ec2_rt_private_b
aws_route_table.nat_ec2_rt_private_c
aws_route_table.nat_eks_rt_private_a
aws_route_table.nat_eks_rt_private_b
aws_route_table.nat_eks_rt_private_c
aws_route_table_association.igw_ec2_rt_public_1a
aws_route_table_association.igw_ec2_rt_public_1b
aws_route_table_association.igw_ec2_rt_public_1c
aws_route_table_association.igw_eks_rt_public_1a
aws_route_table_association.igw_eks_rt_public_1b
aws_route_table_association.igw_eks_rt_public_1c
aws_route_table_association.nat_ec2_rt_private_1a
aws_route_table_association.nat_ec2_rt_private_1b
aws_route_table_association.nat_ec2_rt_private_1c
aws_route_table_association.nat_eks_rt_private_1a
aws_route_table_association.nat_eks_rt_private_1b
aws_route_table_association.nat_eks_rt_private_1c
aws_security_group.default
aws_subnet.ec2_private_a
aws_subnet.ec2_private_b
aws_subnet.ec2_private_c
aws_subnet.ec2_public_a
aws_subnet.ec2_public_b
aws_subnet.ec2_public_c
aws_subnet.eks_private_a
aws_subnet.eks_private_b
aws_subnet.eks_private_c
aws_subnet.eks_public_a
aws_subnet.eks_public_b
aws_subnet.eks_public_c
aws_vpc.infra_vpc
```
