## Output

```json
terraform output
-----
ec2_private_1a = [
  "subnet-01d0de4f57a20427c",
]
ec2_private_1a_cidr = "10.48.16.0/21"
ec2_private_1b = [
  "subnet-0c9c3bedfc915f423",
]
ec2_private_1b_cidr = "10.48.24.0/21"
ec2_public_1a = [
  "subnet-06d437c81e5f07fe6",
]
ec2_public_1a_cidr = "10.48.40.0/21"
ec2_public_1b = [
  "subnet-0161dee6e25dcbb1d",
]
ec2_public_1b_cidr = "10.48.48.0/21"
eks_private_1a = [
  "subnet-0a35b215e7ce84bc2",
]
eks_private_1a_cidr = "10.48.64.0/21"
eks_private_1b = [
  "subnet-01c3ba0f1b3971571",
]
eks_private_1b_cidr = "10.48.72.0/21"
eks_private_1c = [
  "subnet-09262def352efda55",
]
eks_private_1c_cidr = "10.48.80.0/21"
eks_public_1a = [
  "subnet-00b82819dd409c5a1",
]
eks_public_1a_cidr = "10.48.88.0/21"
eks_public_1b = [
  "subnet-005911cfd4ecc2ef1",
]
eks_public_1b_cidr = "10.48.96.0/21"
eks_public_1c = [
  "subnet-08ac4d68d620a644f",
]
eks_public_1c_cidr = "10.48.104.0/21"
security_group_id = "sg-05bd4e646e76673e7"
summary = <<EOT
VPC Summary:
  VPC Id:            vpc-0793476ecc1775586
  Security Group Id: sg-05bd4e646e76673e7
Subnet Private:
  EC2 Private 1a:    subnet-01d0de4f57a20427c
  EC2 Private 1b:    subnet-0c9c3bedfc915f423
  EC2 Private 1c:    subnet-02d8731f5ba61287b
  EKS Private 1a:    subnet-0a35b215e7ce84bc2
  EKS Private 1b:    subnet-01c3ba0f1b3971571
  EKS Private 1c:    subnet-09262def352efda55
Subnet Public:
  EC2 Public 1a:     subnet-06d437c81e5f07fe6
  EC2 Public 1b:     subnet-0161dee6e25dcbb1d
  EC2 Public 1c:     subnet-0c08c9c423e1e4ed6
  EKS Public 1a:     subnet-00b82819dd409c5a1
  EKS Public 1b:     subnet-005911cfd4ecc2ef1
  EKS Public 1c:     subnet-08ac4d68d620a644f
CIDR Block Private:
  EC2 CIDR 1a:       10.48.16.0/21
  EC2 CIDR 1b:       10.48.24.0/21
  EC2 CIDR 1c:       10.48.32.0/21
  EKS CIDR 1a:       10.48.64.0/21
  EKS CIDR 1b:       10.48.72.0/21
  EKS CIDR 1c:       10.48.80.0/21
CIDR Block Public:
  EC2 CIDR 1a:       10.48.40.0/21
  EC2 CIDR 1b:       10.48.48.0/21
  EKS CIDR 1a:       10.48.88.0/21
  EKS CIDR 1b:       10.48.96.0/21
  EKS CIDR 1c:       10.48.104.0/21

EOT
vpc_cidr = "10.48.0.0/16"
vpc_id = "vpc-0793476ecc1775586"
vpc_name = "devopscorner-tf-prod-vpc"
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
