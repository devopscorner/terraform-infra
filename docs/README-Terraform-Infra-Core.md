## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63.0, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ec2_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.eks_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.igw_ec2_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.ec2_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.infra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Target Deployment | `string` | `"ap-southeast-1"` | no |
| <a name="input_coreinfra"></a> [coreinfra](#input\_coreinfra) | ------------------------------------ Prefix Infra ------------------------------------ | `string` | `"devopscorner-tf"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_ec2_prefix"></a> [ec2\_prefix](#input\_ec2\_prefix) | EC2 Prefix Name | `string` | `"ec2"` | no |
| <a name="input_ec2_private_a"></a> [ec2\_private\_a](#input\_ec2\_private\_a) | Private subnet for EC2 zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.16.0/21",<br>  "prod": "10.48.16.0/21",<br>  "staging": "10.32.16.0/21"<br>}</pre> | no |
| <a name="input_ec2_private_b"></a> [ec2\_private\_b](#input\_ec2\_private\_b) | Private subnet for EC2 zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.24.0/21",<br>  "prod": "10.48.24.0/21",<br>  "staging": "10.32.24.0/21"<br>}</pre> | no |
| <a name="input_ec2_private_c"></a> [ec2\_private\_c](#input\_ec2\_private\_c) | Private subnet for EC2 zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.32.0/21",<br>  "prod": "10.48.32.0/21",<br>  "staging": "10.32.32.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_a"></a> [ec2\_public\_a](#input\_ec2\_public\_a) | Public subnet for EC2 zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.40.0/21",<br>  "prod": "10.48.40.0/21",<br>  "staging": "10.32.40.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_b"></a> [ec2\_public\_b](#input\_ec2\_public\_b) | Public subnet for EC2 zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.48.0/21",<br>  "prod": "10.48.48.0/21",<br>  "staging": "10.32.48.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_c"></a> [ec2\_public\_c](#input\_ec2\_public\_c) | Public subnet for EC2 zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.56.0/21",<br>  "prod": "10.48.56.0/21",<br>  "staging": "10.32.56.0/21"<br>}</pre> | no |
| <a name="input_ec2_rt_prefix"></a> [ec2\_rt\_prefix](#input\_ec2\_rt\_prefix) | NAT EC2 Routing Table Prefix Name | `string` | `"ec2-rt"` | no |
| <a name="input_eks_prefix"></a> [eks\_prefix](#input\_eks\_prefix) | EKS Prefix Name | `string` | `"eks"` | no |
| <a name="input_eks_private_a"></a> [eks\_private\_a](#input\_eks\_private\_a) | Private subnet for EKS zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.64.0/21",<br>  "prod": "10.48.64.0/21",<br>  "staging": "10.32.64.0/21"<br>}</pre> | no |
| <a name="input_eks_private_b"></a> [eks\_private\_b](#input\_eks\_private\_b) | Private subnet for EKS zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.72.0/21",<br>  "prod": "10.48.72.0/21",<br>  "staging": "10.32.72.0/21"<br>}</pre> | no |
| <a name="input_eks_private_c"></a> [eks\_private\_c](#input\_eks\_private\_c) | Private subnet for EKS zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.80.0/21",<br>  "prod": "10.48.80.0/21",<br>  "staging": "10.32.80.0/21"<br>}</pre> | no |
| <a name="input_eks_public_a"></a> [eks\_public\_a](#input\_eks\_public\_a) | Public subnet for EKS zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.88.0/21",<br>  "prod": "10.48.88.0/21",<br>  "staging": "10.32.88.0/21"<br>}</pre> | no |
| <a name="input_eks_public_b"></a> [eks\_public\_b](#input\_eks\_public\_b) | Public subnet for EKS zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.96.0/21",<br>  "prod": "10.48.96.0/21",<br>  "staging": "10.32.96.0/21"<br>}</pre> | no |
| <a name="input_eks_public_c"></a> [eks\_public\_c](#input\_eks\_public\_c) | Public subnet for EKS zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.104.0/21",<br>  "prod": "10.48.104.0/21",<br>  "staging": "10.32.104.0/21"<br>}</pre> | no |
| <a name="input_eks_rt_prefix"></a> [eks\_rt\_prefix](#input\_eks\_rt\_prefix) | NAT EKS Routing Table Prefix Name | `string` | `"eks-rt"` | no |
| <a name="input_env"></a> [env](#input\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_igw_prefix"></a> [igw\_prefix](#input\_igw\_prefix) | IGW Prefix Name | `string` | `"igw"` | no |
| <a name="input_igw_rt_prefix"></a> [igw\_rt\_prefix](#input\_igw\_rt\_prefix) | IGW Routing Table Prefix Name | `string` | `"igw-rt"` | no |
| <a name="input_nat_ec2_prefix"></a> [nat\_ec2\_prefix](#input\_nat\_ec2\_prefix) | NAT EC2 Prefix Name | `string` | `"natgw_ec2"` | no |
| <a name="input_nat_eks_prefix"></a> [nat\_eks\_prefix](#input\_nat\_eks\_prefix) | NAT EKS Prefix Name | `string` | `"natgw_eks"` | no |
| <a name="input_nat_prefix"></a> [nat\_prefix](#input\_nat\_prefix) | NAT Prefix Name | `string` | `"nat"` | no |
| <a name="input_nat_rt_prefix"></a> [nat\_rt\_prefix](#input\_nat\_rt\_prefix) | NAT Routing Table Prefix Name | `string` | `"nat-rt"` | no |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | n/a | `map(string)` | <pre>{<br>  "lab": "1234567890",<br>  "prod": "0987654321",<br>  "staging": "1234567890"<br>}</pre> | no |
| <a name="input_propagating_vgws"></a> [propagating\_vgws](#input\_propagating\_vgws) | n/a | `map(string)` | <pre>{<br>  "lab": "vgw-1234567890",<br>  "prod": "vgw-0987654321",<br>  "staging": "vgw-1234567890"<br>}</pre> | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-terraform-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-terraform-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"core/terraform.tfstate"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | ------------------------------------ VPC ------------------------------------ | `map(string)` | <pre>{<br>  "lab": "10.16.0.0/16",<br>  "prod": "10.48.0.0/16",<br>  "staging": "10.32.0.0/16"<br>}</pre> | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | n/a | `map(string)` | <pre>{<br>  "lab": "vpc-1234567890",<br>  "prod": "vpc-0987654321",<br>  "staging": "vpc-1234567890"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_private_1a"></a> [ec2\_private\_1a](#output\_ec2\_private\_1a) | ---------------------------------------------- EC2 Output ---------------------------------------------- EC2 Private |
| <a name="output_ec2_private_1a_cidr"></a> [ec2\_private\_1a\_cidr](#output\_ec2\_private\_1a\_cidr) | n/a |
| <a name="output_ec2_private_1b"></a> [ec2\_private\_1b](#output\_ec2\_private\_1b) | n/a |
| <a name="output_ec2_private_1b_cidr"></a> [ec2\_private\_1b\_cidr](#output\_ec2\_private\_1b\_cidr) | n/a |
| <a name="output_ec2_private_1c"></a> [ec2\_private\_1c](#output\_ec2\_private\_1c) | n/a |
| <a name="output_ec2_private_1c_cidr"></a> [ec2\_private\_1c\_cidr](#output\_ec2\_private\_1c\_cidr) | n/a |
| <a name="output_ec2_public_1a"></a> [ec2\_public\_1a](#output\_ec2\_public\_1a) | EC2 Public |
| <a name="output_ec2_public_1a_cidr"></a> [ec2\_public\_1a\_cidr](#output\_ec2\_public\_1a\_cidr) | n/a |
| <a name="output_ec2_public_1b"></a> [ec2\_public\_1b](#output\_ec2\_public\_1b) | n/a |
| <a name="output_ec2_public_1b_cidr"></a> [ec2\_public\_1b\_cidr](#output\_ec2\_public\_1b\_cidr) | n/a |
| <a name="output_ec2_public_1c"></a> [ec2\_public\_1c](#output\_ec2\_public\_1c) | n/a |
| <a name="output_ec2_public_1c_cidr"></a> [ec2\_public\_1c\_cidr](#output\_ec2\_public\_1c\_cidr) | n/a |
| <a name="output_eks_private_1a"></a> [eks\_private\_1a](#output\_eks\_private\_1a) | ---------------------------------------------- EKS Output ---------------------------------------------- EKS Private |
| <a name="output_eks_private_1a_cidr"></a> [eks\_private\_1a\_cidr](#output\_eks\_private\_1a\_cidr) | n/a |
| <a name="output_eks_private_1b"></a> [eks\_private\_1b](#output\_eks\_private\_1b) | n/a |
| <a name="output_eks_private_1b_cidr"></a> [eks\_private\_1b\_cidr](#output\_eks\_private\_1b\_cidr) | n/a |
| <a name="output_eks_private_1c"></a> [eks\_private\_1c](#output\_eks\_private\_1c) | n/a |
| <a name="output_eks_private_1c_cidr"></a> [eks\_private\_1c\_cidr](#output\_eks\_private\_1c\_cidr) | n/a |
| <a name="output_eks_public_1a"></a> [eks\_public\_1a](#output\_eks\_public\_1a) | EKS Public |
| <a name="output_eks_public_1a_cidr"></a> [eks\_public\_1a\_cidr](#output\_eks\_public\_1a\_cidr) | n/a |
| <a name="output_eks_public_1b"></a> [eks\_public\_1b](#output\_eks\_public\_1b) | n/a |
| <a name="output_eks_public_1b_cidr"></a> [eks\_public\_1b\_cidr](#output\_eks\_public\_1b\_cidr) | n/a |
| <a name="output_eks_public_1c"></a> [eks\_public\_1c](#output\_eks\_public\_1c) | n/a |
| <a name="output_eks_public_1c_cidr"></a> [eks\_public\_1c\_cidr](#output\_eks\_public\_1c\_cidr) | n/a |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_summary"></a> [summary](#output\_summary) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63.0, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ec2_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.eks_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.igw_ec2_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_ec2_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.igw_eks_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_ec2_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat_eks_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_ec2_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.igw_eks_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.ec2_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.ec2_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.eks_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.infra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Target Deployment | `string` | `"ap-southeast-1"` | no |
| <a name="input_coreinfra"></a> [coreinfra](#input\_coreinfra) | ------------------------------------ Prefix Infra ------------------------------------ | `string` | `"devopscorner-tf"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_ec2_prefix"></a> [ec2\_prefix](#input\_ec2\_prefix) | EC2 Prefix Name | `string` | `"ec2"` | no |
| <a name="input_ec2_private_a"></a> [ec2\_private\_a](#input\_ec2\_private\_a) | Private subnet for EC2 zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.16.0/21",<br>  "prod": "10.48.16.0/21",<br>  "staging": "10.32.16.0/21"<br>}</pre> | no |
| <a name="input_ec2_private_b"></a> [ec2\_private\_b](#input\_ec2\_private\_b) | Private subnet for EC2 zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.24.0/21",<br>  "prod": "10.48.24.0/21",<br>  "staging": "10.32.24.0/21"<br>}</pre> | no |
| <a name="input_ec2_private_c"></a> [ec2\_private\_c](#input\_ec2\_private\_c) | Private subnet for EC2 zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.32.0/21",<br>  "prod": "10.48.32.0/21",<br>  "staging": "10.32.32.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_a"></a> [ec2\_public\_a](#input\_ec2\_public\_a) | Public subnet for EC2 zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.40.0/21",<br>  "prod": "10.48.40.0/21",<br>  "staging": "10.32.40.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_b"></a> [ec2\_public\_b](#input\_ec2\_public\_b) | Public subnet for EC2 zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.48.0/21",<br>  "prod": "10.48.48.0/21",<br>  "staging": "10.32.48.0/21"<br>}</pre> | no |
| <a name="input_ec2_public_c"></a> [ec2\_public\_c](#input\_ec2\_public\_c) | Public subnet for EC2 zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.56.0/21",<br>  "prod": "10.48.56.0/21",<br>  "staging": "10.32.56.0/21"<br>}</pre> | no |
| <a name="input_ec2_rt_prefix"></a> [ec2\_rt\_prefix](#input\_ec2\_rt\_prefix) | NAT EC2 Routing Table Prefix Name | `string` | `"ec2-rt"` | no |
| <a name="input_eks_prefix"></a> [eks\_prefix](#input\_eks\_prefix) | EKS Prefix Name | `string` | `"eks"` | no |
| <a name="input_eks_private_a"></a> [eks\_private\_a](#input\_eks\_private\_a) | Private subnet for EKS zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.64.0/21",<br>  "prod": "10.48.64.0/21",<br>  "staging": "10.32.64.0/21"<br>}</pre> | no |
| <a name="input_eks_private_b"></a> [eks\_private\_b](#input\_eks\_private\_b) | Private subnet for EKS zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.72.0/21",<br>  "prod": "10.48.72.0/21",<br>  "staging": "10.32.72.0/21"<br>}</pre> | no |
| <a name="input_eks_private_c"></a> [eks\_private\_c](#input\_eks\_private\_c) | Private subnet for EKS zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.80.0/21",<br>  "prod": "10.48.80.0/21",<br>  "staging": "10.32.80.0/21"<br>}</pre> | no |
| <a name="input_eks_public_a"></a> [eks\_public\_a](#input\_eks\_public\_a) | Public subnet for EKS zone 1a | `map(string)` | <pre>{<br>  "lab": "10.16.88.0/21",<br>  "prod": "10.48.88.0/21",<br>  "staging": "10.32.88.0/21"<br>}</pre> | no |
| <a name="input_eks_public_b"></a> [eks\_public\_b](#input\_eks\_public\_b) | Public subnet for EKS zone 1b | `map(string)` | <pre>{<br>  "lab": "10.16.96.0/21",<br>  "prod": "10.48.96.0/21",<br>  "staging": "10.32.96.0/21"<br>}</pre> | no |
| <a name="input_eks_public_c"></a> [eks\_public\_c](#input\_eks\_public\_c) | Public subnet for EKS zone 1c | `map(string)` | <pre>{<br>  "lab": "10.16.104.0/21",<br>  "prod": "10.48.104.0/21",<br>  "staging": "10.32.104.0/21"<br>}</pre> | no |
| <a name="input_eks_rt_prefix"></a> [eks\_rt\_prefix](#input\_eks\_rt\_prefix) | NAT EKS Routing Table Prefix Name | `string` | `"eks-rt"` | no |
| <a name="input_env"></a> [env](#input\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_igw_prefix"></a> [igw\_prefix](#input\_igw\_prefix) | IGW Prefix Name | `string` | `"igw"` | no |
| <a name="input_igw_rt_prefix"></a> [igw\_rt\_prefix](#input\_igw\_rt\_prefix) | IGW Routing Table Prefix Name | `string` | `"igw-rt"` | no |
| <a name="input_nat_ec2_prefix"></a> [nat\_ec2\_prefix](#input\_nat\_ec2\_prefix) | NAT EC2 Prefix Name | `string` | `"natgw_ec2"` | no |
| <a name="input_nat_eks_prefix"></a> [nat\_eks\_prefix](#input\_nat\_eks\_prefix) | NAT EKS Prefix Name | `string` | `"natgw_eks"` | no |
| <a name="input_nat_prefix"></a> [nat\_prefix](#input\_nat\_prefix) | NAT Prefix Name | `string` | `"nat"` | no |
| <a name="input_nat_rt_prefix"></a> [nat\_rt\_prefix](#input\_nat\_rt\_prefix) | NAT Routing Table Prefix Name | `string` | `"nat-rt"` | no |
| <a name="input_peer_owner_id"></a> [peer\_owner\_id](#input\_peer\_owner\_id) | n/a | `map(string)` | <pre>{<br>  "lab": "1234567890",<br>  "prod": "0987654321",<br>  "staging": "1234567890"<br>}</pre> | no |
| <a name="input_propagating_vgws"></a> [propagating\_vgws](#input\_propagating\_vgws) | n/a | `map(string)` | <pre>{<br>  "lab": "vgw-1234567890",<br>  "prod": "vgw-0987654321",<br>  "staging": "vgw-1234567890"<br>}</pre> | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-terraform-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-terraform-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"core/terraform.tfstate"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | ------------------------------------ VPC ------------------------------------ | `map(string)` | <pre>{<br>  "lab": "10.16.0.0/16",<br>  "prod": "10.48.0.0/16",<br>  "staging": "10.32.0.0/16"<br>}</pre> | no |
| <a name="input_vpc_peer"></a> [vpc\_peer](#input\_vpc\_peer) | n/a | `map(string)` | <pre>{<br>  "lab": "vpc-1234567890",<br>  "prod": "vpc-0987654321",<br>  "staging": "vpc-1234567890"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_private_1a"></a> [ec2\_private\_1a](#output\_ec2\_private\_1a) | ---------------------------------------------- EC2 Output ---------------------------------------------- EC2 Private |
| <a name="output_ec2_private_1a_cidr"></a> [ec2\_private\_1a\_cidr](#output\_ec2\_private\_1a\_cidr) | n/a |
| <a name="output_ec2_private_1b"></a> [ec2\_private\_1b](#output\_ec2\_private\_1b) | n/a |
| <a name="output_ec2_private_1b_cidr"></a> [ec2\_private\_1b\_cidr](#output\_ec2\_private\_1b\_cidr) | n/a |
| <a name="output_ec2_private_1c"></a> [ec2\_private\_1c](#output\_ec2\_private\_1c) | n/a |
| <a name="output_ec2_private_1c_cidr"></a> [ec2\_private\_1c\_cidr](#output\_ec2\_private\_1c\_cidr) | n/a |
| <a name="output_ec2_public_1a"></a> [ec2\_public\_1a](#output\_ec2\_public\_1a) | EC2 Public |
| <a name="output_ec2_public_1a_cidr"></a> [ec2\_public\_1a\_cidr](#output\_ec2\_public\_1a\_cidr) | n/a |
| <a name="output_ec2_public_1b"></a> [ec2\_public\_1b](#output\_ec2\_public\_1b) | n/a |
| <a name="output_ec2_public_1b_cidr"></a> [ec2\_public\_1b\_cidr](#output\_ec2\_public\_1b\_cidr) | n/a |
| <a name="output_ec2_public_1c"></a> [ec2\_public\_1c](#output\_ec2\_public\_1c) | n/a |
| <a name="output_ec2_public_1c_cidr"></a> [ec2\_public\_1c\_cidr](#output\_ec2\_public\_1c\_cidr) | n/a |
| <a name="output_eks_private_1a"></a> [eks\_private\_1a](#output\_eks\_private\_1a) | ---------------------------------------------- EKS Output ---------------------------------------------- EKS Private |
| <a name="output_eks_private_1a_cidr"></a> [eks\_private\_1a\_cidr](#output\_eks\_private\_1a\_cidr) | n/a |
| <a name="output_eks_private_1b"></a> [eks\_private\_1b](#output\_eks\_private\_1b) | n/a |
| <a name="output_eks_private_1b_cidr"></a> [eks\_private\_1b\_cidr](#output\_eks\_private\_1b\_cidr) | n/a |
| <a name="output_eks_private_1c"></a> [eks\_private\_1c](#output\_eks\_private\_1c) | n/a |
| <a name="output_eks_private_1c_cidr"></a> [eks\_private\_1c\_cidr](#output\_eks\_private\_1c\_cidr) | n/a |
| <a name="output_eks_public_1a"></a> [eks\_public\_1a](#output\_eks\_public\_1a) | EKS Public |
| <a name="output_eks_public_1a_cidr"></a> [eks\_public\_1a\_cidr](#output\_eks\_public\_1a\_cidr) | n/a |
| <a name="output_eks_public_1b"></a> [eks\_public\_1b](#output\_eks\_public\_1b) | n/a |
| <a name="output_eks_public_1b_cidr"></a> [eks\_public\_1b\_cidr](#output\_eks\_public\_1b\_cidr) | n/a |
| <a name="output_eks_public_1c"></a> [eks\_public\_1c](#output\_eks\_public\_1c) | n/a |
| <a name="output_eks_public_1c_cidr"></a> [eks\_public\_1c\_cidr](#output\_eks\_public\_1c\_cidr) | n/a |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_summary"></a> [summary](#output\_summary) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |
<!-- END_TF_DOCS -->