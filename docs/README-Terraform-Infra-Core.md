## Requirements

| Name                                                                     | Version          |
| ------------------------------------------------------------------------ | ---------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.9         |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.63.0, < 4.0 |

## Providers

| Name                                             | Version          |
| ------------------------------------------------ | ---------------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                     | Type     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_eip.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                           | resource |
| [aws_eip.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                           | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                                 | resource |
| [aws_nat_gateway.ec2_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                       | resource |
| [aws_nat_gateway.eks_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                       | resource |
| [aws_route_table.igw_ec2_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_ec2_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_ec2_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.nat_ec2_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_ec2_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_ec2_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table_association.igw_ec2_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_ec2_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_ec2_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.nat_ec2_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                 | resource |
| [aws_subnet.ec2_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.ec2_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.ec2_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_vpc.infra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                     | resource |

## Inputs

| Name                                                                                                | Description                                                                            | Type          | Default                                                                                                      | Required |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region)                                     | AWS Region Target Deployment                                                           | `string`      | `"ap-southeast-1"`                                                                                           |    no    |
| <a name="input_coreinfra"></a> [coreinfra](#input_coreinfra)                                        | ------------------------------------ Prefix Infra ------------------------------------ | `string`      | `"devopscorner-tf"`                                                                                          |    no    |
| <a name="input_department"></a> [department](#input_department)                                     | Department Owner                                                                       | `string`      | `"DEVOPS"`                                                                                                   |    no    |
| <a name="input_ec2_prefix"></a> [ec2_prefix](#input_ec2_prefix)                                     | EC2 Prefix Name                                                                        | `string`      | `"ec2"`                                                                                                      |    no    |
| <a name="input_ec2_private_a"></a> [ec2_private_a](#input_ec2_private_a)                            | Private subnet for EC2 zone 1a                                                         | `map(string)` | <pre>{<br> "lab": "10.16.16.0/21",<br> "prod": "10.48.16.0/21",<br> "staging": "10.32.16.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_private_b"></a> [ec2_private_b](#input_ec2_private_b)                            | Private subnet for EC2 zone 1b                                                         | `map(string)` | <pre>{<br> "lab": "10.16.24.0/21",<br> "prod": "10.48.24.0/21",<br> "staging": "10.32.24.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_private_c"></a> [ec2_private_c](#input_ec2_private_c)                            | Private subnet for EC2 zone 1c                                                         | `map(string)` | <pre>{<br> "lab": "10.16.32.0/21",<br> "prod": "10.48.32.0/21",<br> "staging": "10.32.32.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_a"></a> [ec2_public_a](#input_ec2_public_a)                               | Public subnet for EC2 zone 1a                                                          | `map(string)` | <pre>{<br> "lab": "10.16.40.0/21",<br> "prod": "10.48.40.0/21",<br> "staging": "10.32.40.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_b"></a> [ec2_public_b](#input_ec2_public_b)                               | Public subnet for EC2 zone 1b                                                          | `map(string)` | <pre>{<br> "lab": "10.16.48.0/21",<br> "prod": "10.48.48.0/21",<br> "staging": "10.32.48.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_c"></a> [ec2_public_c](#input_ec2_public_c)                               | Public subnet for EC2 zone 1c                                                          | `map(string)` | <pre>{<br> "lab": "10.16.56.0/21",<br> "prod": "10.48.56.0/21",<br> "staging": "10.32.56.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_rt_prefix"></a> [ec2_rt_prefix](#input_ec2_rt_prefix)                            | NAT EC2 Routing Table Prefix Name                                                      | `string`      | `"ec2-rt"`                                                                                                   |    no    |
| <a name="input_eks_prefix"></a> [eks_prefix](#input_eks_prefix)                                     | EKS Prefix Name                                                                        | `string`      | `"eks"`                                                                                                      |    no    |
| <a name="input_eks_private_a"></a> [eks_private_a](#input_eks_private_a)                            | Private subnet for EKS zone 1a                                                         | `map(string)` | <pre>{<br> "lab": "10.16.64.0/21",<br> "prod": "10.48.64.0/21",<br> "staging": "10.32.64.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_private_b"></a> [eks_private_b](#input_eks_private_b)                            | Private subnet for EKS zone 1b                                                         | `map(string)` | <pre>{<br> "lab": "10.16.72.0/21",<br> "prod": "10.48.72.0/21",<br> "staging": "10.32.72.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_private_c"></a> [eks_private_c](#input_eks_private_c)                            | Private subnet for EKS zone 1c                                                         | `map(string)` | <pre>{<br> "lab": "10.16.80.0/21",<br> "prod": "10.48.80.0/21",<br> "staging": "10.32.80.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_a"></a> [eks_public_a](#input_eks_public_a)                               | Public subnet for EKS zone 1a                                                          | `map(string)` | <pre>{<br> "lab": "10.16.88.0/21",<br> "prod": "10.48.88.0/21",<br> "staging": "10.32.88.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_b"></a> [eks_public_b](#input_eks_public_b)                               | Public subnet for EKS zone 1b                                                          | `map(string)` | <pre>{<br> "lab": "10.16.96.0/21",<br> "prod": "10.48.96.0/21",<br> "staging": "10.32.96.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_c"></a> [eks_public_c](#input_eks_public_c)                               | Public subnet for EKS zone 1c                                                          | `map(string)` | <pre>{<br> "lab": "10.16.104.0/21",<br> "prod": "10.48.104.0/21",<br> "staging": "10.32.104.0/21"<br>}</pre> |    no    |
| <a name="input_eks_rt_prefix"></a> [eks_rt_prefix](#input_eks_rt_prefix)                            | NAT EKS Routing Table Prefix Name                                                      | `string`      | `"eks-rt"`                                                                                                   |    no    |
| <a name="input_env"></a> [env](#input_env)                                                          | Workspace Environment Selection                                                        | `map(string)` | <pre>{<br> "lab": "lab",<br> "prod": "prod",<br> "staging": "staging"<br>}</pre>                             |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                                  | Target Environment (tags)                                                              | `map(string)` | <pre>{<br> "lab": "RND",<br> "prod": "PROD",<br> "staging": "STG"<br>}</pre>                                 |    no    |
| <a name="input_igw_prefix"></a> [igw_prefix](#input_igw_prefix)                                     | IGW Prefix Name                                                                        | `string`      | `"igw"`                                                                                                      |    no    |
| <a name="input_igw_rt_prefix"></a> [igw_rt_prefix](#input_igw_rt_prefix)                            | IGW Routing Table Prefix Name                                                          | `string`      | `"igw-rt"`                                                                                                   |    no    |
| <a name="input_nat_ec2_prefix"></a> [nat_ec2_prefix](#input_nat_ec2_prefix)                         | NAT EC2 Prefix Name                                                                    | `string`      | `"natgw_ec2"`                                                                                                |    no    |
| <a name="input_nat_eks_prefix"></a> [nat_eks_prefix](#input_nat_eks_prefix)                         | NAT EKS Prefix Name                                                                    | `string`      | `"natgw_eks"`                                                                                                |    no    |
| <a name="input_nat_prefix"></a> [nat_prefix](#input_nat_prefix)                                     | NAT Prefix Name                                                                        | `string`      | `"nat"`                                                                                                      |    no    |
| <a name="input_nat_rt_prefix"></a> [nat_rt_prefix](#input_nat_rt_prefix)                            | NAT Routing Table Prefix Name                                                          | `string`      | `"nat-rt"`                                                                                                   |    no    |
| <a name="input_peer_owner_id"></a> [peer_owner_id](#input_peer_owner_id)                            | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "1234567890",<br> "prod": "0987654321",<br> "staging": "1234567890"<br>}</pre>             |    no    |
| <a name="input_propagating_vgws"></a> [propagating_vgws](#input_propagating_vgws)                   | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "vgw-1234567890",<br> "prod": "vgw-0987654321",<br> "staging": "vgw-1234567890"<br>}</pre> |    no    |
| <a name="input_tfstate_bucket"></a> [tfstate_bucket](#input_tfstate_bucket)                         | Name of bucket to store tfstate                                                        | `string`      | `"devopscorner-terraform-remote-state"`                                                                      |    no    |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate_dynamodb_table](#input_tfstate_dynamodb_table) | Name of dynamodb table to store tfstate                                                | `string`      | `"devopscorner-terraform-state-lock"`                                                                        |    no    |
| <a name="input_tfstate_encrypt"></a> [tfstate_encrypt](#input_tfstate_encrypt)                      | Name of bucket to store tfstate                                                        | `bool`        | `true`                                                                                                       |    no    |
| <a name="input_tfstate_path"></a> [tfstate_path](#input_tfstate_path)                               | Path .tfstate in Bucket                                                                | `string`      | `"core/terraform.tfstate"`                                                                                   |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                                           | ------------------------------------ VPC ------------------------------------          | `map(string)` | <pre>{<br> "lab": "10.16.0.0/16",<br> "prod": "10.48.0.0/16",<br> "staging": "10.32.0.0/16"<br>}</pre>       |    no    |
| <a name="input_vpc_peer"></a> [vpc_peer](#input_vpc_peer)                                           | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "vpc-1234567890",<br> "prod": "vpc-0987654321",<br> "staging": "vpc-1234567890"<br>}</pre> |    no    |

## Outputs

| Name                                                                                         | Description                                                                                                          |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| <a name="output_ec2_private_1a"></a> [ec2_private_1a](#output_ec2_private_1a)                | ---------------------------------------------- EC2 Output ---------------------------------------------- EC2 Private |
| <a name="output_ec2_private_1a_cidr"></a> [ec2_private_1a_cidr](#output_ec2_private_1a_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_private_1b"></a> [ec2_private_1b](#output_ec2_private_1b)                | n/a                                                                                                                  |
| <a name="output_ec2_private_1b_cidr"></a> [ec2_private_1b_cidr](#output_ec2_private_1b_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_private_1c"></a> [ec2_private_1c](#output_ec2_private_1c)                | n/a                                                                                                                  |
| <a name="output_ec2_private_1c_cidr"></a> [ec2_private_1c_cidr](#output_ec2_private_1c_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_public_1a"></a> [ec2_public_1a](#output_ec2_public_1a)                   | EC2 Public                                                                                                           |
| <a name="output_ec2_public_1a_cidr"></a> [ec2_public_1a_cidr](#output_ec2_public_1a_cidr)    | n/a                                                                                                                  |
| <a name="output_ec2_public_1b"></a> [ec2_public_1b](#output_ec2_public_1b)                   | n/a                                                                                                                  |
| <a name="output_ec2_public_1b_cidr"></a> [ec2_public_1b_cidr](#output_ec2_public_1b_cidr)    | n/a                                                                                                                  |
| <a name="output_ec2_public_1c"></a> [ec2_public_1c](#output_ec2_public_1c)                   | n/a                                                                                                                  |
| <a name="output_ec2_public_1c_cidr"></a> [ec2_public_1c_cidr](#output_ec2_public_1c_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_private_1a"></a> [eks_private_1a](#output_eks_private_1a)                | ---------------------------------------------- EKS Output ---------------------------------------------- EKS Private |
| <a name="output_eks_private_1a_cidr"></a> [eks_private_1a_cidr](#output_eks_private_1a_cidr) | n/a                                                                                                                  |
| <a name="output_eks_private_1b"></a> [eks_private_1b](#output_eks_private_1b)                | n/a                                                                                                                  |
| <a name="output_eks_private_1b_cidr"></a> [eks_private_1b_cidr](#output_eks_private_1b_cidr) | n/a                                                                                                                  |
| <a name="output_eks_private_1c"></a> [eks_private_1c](#output_eks_private_1c)                | n/a                                                                                                                  |
| <a name="output_eks_private_1c_cidr"></a> [eks_private_1c_cidr](#output_eks_private_1c_cidr) | n/a                                                                                                                  |
| <a name="output_eks_public_1a"></a> [eks_public_1a](#output_eks_public_1a)                   | EKS Public                                                                                                           |
| <a name="output_eks_public_1a_cidr"></a> [eks_public_1a_cidr](#output_eks_public_1a_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_public_1b"></a> [eks_public_1b](#output_eks_public_1b)                   | n/a                                                                                                                  |
| <a name="output_eks_public_1b_cidr"></a> [eks_public_1b_cidr](#output_eks_public_1b_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_public_1c"></a> [eks_public_1c](#output_eks_public_1c)                   | n/a                                                                                                                  |
| <a name="output_eks_public_1c_cidr"></a> [eks_public_1c_cidr](#output_eks_public_1c_cidr)    | n/a                                                                                                                  |
| <a name="output_security_group_id"></a> [security_group_id](#output_security_group_id)       | n/a                                                                                                                  |
| <a name="output_summary"></a> [summary](#output_summary)                                     | n/a                                                                                                                  |
| <a name="output_vpc_cidr"></a> [vpc_cidr](#output_vpc_cidr)                                  | n/a                                                                                                                  |
| <a name="output_vpc_id"></a> [vpc_id](#output_vpc_id)                                        | n/a                                                                                                                  |
| <a name="output_vpc_name"></a> [vpc_name](#output_vpc_name)                                  | n/a                                                                                                                  |

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version          |
| ------------------------------------------------------------------------ | ---------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.9         |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.63.0, < 4.0 |

## Providers

| Name                                             | Version          |
| ------------------------------------------------ | ---------------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                     | Type     |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_eip.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                           | resource |
| [aws_eip.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                           | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                                 | resource |
| [aws_nat_gateway.ec2_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                       | resource |
| [aws_nat_gateway.eks_ngw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                       | resource |
| [aws_route_table.igw_ec2_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_ec2_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_ec2_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.igw_eks_rt_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                           | resource |
| [aws_route_table.nat_ec2_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_ec2_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_ec2_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table.nat_eks_rt_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                          | resource |
| [aws_route_table_association.igw_ec2_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_ec2_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_ec2_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.igw_eks_rt_public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_route_table_association.nat_ec2_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_ec2_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.nat_eks_rt_private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                 | resource |
| [aws_subnet.ec2_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.ec2_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.ec2_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.ec2_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_private_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_private_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_private_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.eks_public_a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_public_b](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_subnet.eks_public_c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                            | resource |
| [aws_vpc.infra_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                     | resource |

## Inputs

| Name                                                                                                | Description                                                                            | Type          | Default                                                                                                      | Required |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region)                                     | AWS Region Target Deployment                                                           | `string`      | `"ap-southeast-1"`                                                                                           |    no    |
| <a name="input_coreinfra"></a> [coreinfra](#input_coreinfra)                                        | ------------------------------------ Prefix Infra ------------------------------------ | `string`      | `"devopscorner-tf"`                                                                                          |    no    |
| <a name="input_department"></a> [department](#input_department)                                     | Department Owner                                                                       | `string`      | `"DEVOPS"`                                                                                                   |    no    |
| <a name="input_ec2_prefix"></a> [ec2_prefix](#input_ec2_prefix)                                     | EC2 Prefix Name                                                                        | `string`      | `"ec2"`                                                                                                      |    no    |
| <a name="input_ec2_private_a"></a> [ec2_private_a](#input_ec2_private_a)                            | Private subnet for EC2 zone 1a                                                         | `map(string)` | <pre>{<br> "lab": "10.16.16.0/21",<br> "prod": "10.48.16.0/21",<br> "staging": "10.32.16.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_private_b"></a> [ec2_private_b](#input_ec2_private_b)                            | Private subnet for EC2 zone 1b                                                         | `map(string)` | <pre>{<br> "lab": "10.16.24.0/21",<br> "prod": "10.48.24.0/21",<br> "staging": "10.32.24.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_private_c"></a> [ec2_private_c](#input_ec2_private_c)                            | Private subnet for EC2 zone 1c                                                         | `map(string)` | <pre>{<br> "lab": "10.16.32.0/21",<br> "prod": "10.48.32.0/21",<br> "staging": "10.32.32.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_a"></a> [ec2_public_a](#input_ec2_public_a)                               | Public subnet for EC2 zone 1a                                                          | `map(string)` | <pre>{<br> "lab": "10.16.40.0/21",<br> "prod": "10.48.40.0/21",<br> "staging": "10.32.40.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_b"></a> [ec2_public_b](#input_ec2_public_b)                               | Public subnet for EC2 zone 1b                                                          | `map(string)` | <pre>{<br> "lab": "10.16.48.0/21",<br> "prod": "10.48.48.0/21",<br> "staging": "10.32.48.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_public_c"></a> [ec2_public_c](#input_ec2_public_c)                               | Public subnet for EC2 zone 1c                                                          | `map(string)` | <pre>{<br> "lab": "10.16.56.0/21",<br> "prod": "10.48.56.0/21",<br> "staging": "10.32.56.0/21"<br>}</pre>    |    no    |
| <a name="input_ec2_rt_prefix"></a> [ec2_rt_prefix](#input_ec2_rt_prefix)                            | NAT EC2 Routing Table Prefix Name                                                      | `string`      | `"ec2-rt"`                                                                                                   |    no    |
| <a name="input_eks_prefix"></a> [eks_prefix](#input_eks_prefix)                                     | EKS Prefix Name                                                                        | `string`      | `"eks"`                                                                                                      |    no    |
| <a name="input_eks_private_a"></a> [eks_private_a](#input_eks_private_a)                            | Private subnet for EKS zone 1a                                                         | `map(string)` | <pre>{<br> "lab": "10.16.64.0/21",<br> "prod": "10.48.64.0/21",<br> "staging": "10.32.64.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_private_b"></a> [eks_private_b](#input_eks_private_b)                            | Private subnet for EKS zone 1b                                                         | `map(string)` | <pre>{<br> "lab": "10.16.72.0/21",<br> "prod": "10.48.72.0/21",<br> "staging": "10.32.72.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_private_c"></a> [eks_private_c](#input_eks_private_c)                            | Private subnet for EKS zone 1c                                                         | `map(string)` | <pre>{<br> "lab": "10.16.80.0/21",<br> "prod": "10.48.80.0/21",<br> "staging": "10.32.80.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_a"></a> [eks_public_a](#input_eks_public_a)                               | Public subnet for EKS zone 1a                                                          | `map(string)` | <pre>{<br> "lab": "10.16.88.0/21",<br> "prod": "10.48.88.0/21",<br> "staging": "10.32.88.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_b"></a> [eks_public_b](#input_eks_public_b)                               | Public subnet for EKS zone 1b                                                          | `map(string)` | <pre>{<br> "lab": "10.16.96.0/21",<br> "prod": "10.48.96.0/21",<br> "staging": "10.32.96.0/21"<br>}</pre>    |    no    |
| <a name="input_eks_public_c"></a> [eks_public_c](#input_eks_public_c)                               | Public subnet for EKS zone 1c                                                          | `map(string)` | <pre>{<br> "lab": "10.16.104.0/21",<br> "prod": "10.48.104.0/21",<br> "staging": "10.32.104.0/21"<br>}</pre> |    no    |
| <a name="input_eks_rt_prefix"></a> [eks_rt_prefix](#input_eks_rt_prefix)                            | NAT EKS Routing Table Prefix Name                                                      | `string`      | `"eks-rt"`                                                                                                   |    no    |
| <a name="input_env"></a> [env](#input_env)                                                          | Workspace Environment Selection                                                        | `map(string)` | <pre>{<br> "lab": "lab",<br> "prod": "prod",<br> "staging": "staging"<br>}</pre>                             |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                                  | Target Environment (tags)                                                              | `map(string)` | <pre>{<br> "lab": "RND",<br> "prod": "PROD",<br> "staging": "STG"<br>}</pre>                                 |    no    |
| <a name="input_igw_prefix"></a> [igw_prefix](#input_igw_prefix)                                     | IGW Prefix Name                                                                        | `string`      | `"igw"`                                                                                                      |    no    |
| <a name="input_igw_rt_prefix"></a> [igw_rt_prefix](#input_igw_rt_prefix)                            | IGW Routing Table Prefix Name                                                          | `string`      | `"igw-rt"`                                                                                                   |    no    |
| <a name="input_nat_ec2_prefix"></a> [nat_ec2_prefix](#input_nat_ec2_prefix)                         | NAT EC2 Prefix Name                                                                    | `string`      | `"natgw_ec2"`                                                                                                |    no    |
| <a name="input_nat_eks_prefix"></a> [nat_eks_prefix](#input_nat_eks_prefix)                         | NAT EKS Prefix Name                                                                    | `string`      | `"natgw_eks"`                                                                                                |    no    |
| <a name="input_nat_prefix"></a> [nat_prefix](#input_nat_prefix)                                     | NAT Prefix Name                                                                        | `string`      | `"nat"`                                                                                                      |    no    |
| <a name="input_nat_rt_prefix"></a> [nat_rt_prefix](#input_nat_rt_prefix)                            | NAT Routing Table Prefix Name                                                          | `string`      | `"nat-rt"`                                                                                                   |    no    |
| <a name="input_peer_owner_id"></a> [peer_owner_id](#input_peer_owner_id)                            | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "1234567890",<br> "prod": "0987654321",<br> "staging": "1234567890"<br>}</pre>             |    no    |
| <a name="input_propagating_vgws"></a> [propagating_vgws](#input_propagating_vgws)                   | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "vgw-1234567890",<br> "prod": "vgw-0987654321",<br> "staging": "vgw-1234567890"<br>}</pre> |    no    |
| <a name="input_tfstate_bucket"></a> [tfstate_bucket](#input_tfstate_bucket)                         | Name of bucket to store tfstate                                                        | `string`      | `"devopscorner-terraform-remote-state"`                                                                      |    no    |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate_dynamodb_table](#input_tfstate_dynamodb_table) | Name of dynamodb table to store tfstate                                                | `string`      | `"devopscorner-terraform-state-lock"`                                                                        |    no    |
| <a name="input_tfstate_encrypt"></a> [tfstate_encrypt](#input_tfstate_encrypt)                      | Name of bucket to store tfstate                                                        | `bool`        | `true`                                                                                                       |    no    |
| <a name="input_tfstate_path"></a> [tfstate_path](#input_tfstate_path)                               | Path .tfstate in Bucket                                                                | `string`      | `"core/terraform.tfstate"`                                                                                   |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                                           | ------------------------------------ VPC ------------------------------------          | `map(string)` | <pre>{<br> "lab": "10.16.0.0/16",<br> "prod": "10.48.0.0/16",<br> "staging": "10.32.0.0/16"<br>}</pre>       |    no    |
| <a name="input_vpc_peer"></a> [vpc_peer](#input_vpc_peer)                                           | n/a                                                                                    | `map(string)` | <pre>{<br> "lab": "vpc-1234567890",<br> "prod": "vpc-0987654321",<br> "staging": "vpc-1234567890"<br>}</pre> |    no    |

## Outputs

| Name                                                                                         | Description                                                                                                          |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| <a name="output_ec2_private_1a"></a> [ec2_private_1a](#output_ec2_private_1a)                | ---------------------------------------------- EC2 Output ---------------------------------------------- EC2 Private |
| <a name="output_ec2_private_1a_cidr"></a> [ec2_private_1a_cidr](#output_ec2_private_1a_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_private_1b"></a> [ec2_private_1b](#output_ec2_private_1b)                | n/a                                                                                                                  |
| <a name="output_ec2_private_1b_cidr"></a> [ec2_private_1b_cidr](#output_ec2_private_1b_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_private_1c"></a> [ec2_private_1c](#output_ec2_private_1c)                | n/a                                                                                                                  |
| <a name="output_ec2_private_1c_cidr"></a> [ec2_private_1c_cidr](#output_ec2_private_1c_cidr) | n/a                                                                                                                  |
| <a name="output_ec2_public_1a"></a> [ec2_public_1a](#output_ec2_public_1a)                   | EC2 Public                                                                                                           |
| <a name="output_ec2_public_1a_cidr"></a> [ec2_public_1a_cidr](#output_ec2_public_1a_cidr)    | n/a                                                                                                                  |
| <a name="output_ec2_public_1b"></a> [ec2_public_1b](#output_ec2_public_1b)                   | n/a                                                                                                                  |
| <a name="output_ec2_public_1b_cidr"></a> [ec2_public_1b_cidr](#output_ec2_public_1b_cidr)    | n/a                                                                                                                  |
| <a name="output_ec2_public_1c"></a> [ec2_public_1c](#output_ec2_public_1c)                   | n/a                                                                                                                  |
| <a name="output_ec2_public_1c_cidr"></a> [ec2_public_1c_cidr](#output_ec2_public_1c_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_private_1a"></a> [eks_private_1a](#output_eks_private_1a)                | ---------------------------------------------- EKS Output ---------------------------------------------- EKS Private |
| <a name="output_eks_private_1a_cidr"></a> [eks_private_1a_cidr](#output_eks_private_1a_cidr) | n/a                                                                                                                  |
| <a name="output_eks_private_1b"></a> [eks_private_1b](#output_eks_private_1b)                | n/a                                                                                                                  |
| <a name="output_eks_private_1b_cidr"></a> [eks_private_1b_cidr](#output_eks_private_1b_cidr) | n/a                                                                                                                  |
| <a name="output_eks_private_1c"></a> [eks_private_1c](#output_eks_private_1c)                | n/a                                                                                                                  |
| <a name="output_eks_private_1c_cidr"></a> [eks_private_1c_cidr](#output_eks_private_1c_cidr) | n/a                                                                                                                  |
| <a name="output_eks_public_1a"></a> [eks_public_1a](#output_eks_public_1a)                   | EKS Public                                                                                                           |
| <a name="output_eks_public_1a_cidr"></a> [eks_public_1a_cidr](#output_eks_public_1a_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_public_1b"></a> [eks_public_1b](#output_eks_public_1b)                   | n/a                                                                                                                  |
| <a name="output_eks_public_1b_cidr"></a> [eks_public_1b_cidr](#output_eks_public_1b_cidr)    | n/a                                                                                                                  |
| <a name="output_eks_public_1c"></a> [eks_public_1c](#output_eks_public_1c)                   | n/a                                                                                                                  |
| <a name="output_eks_public_1c_cidr"></a> [eks_public_1c_cidr](#output_eks_public_1c_cidr)    | n/a                                                                                                                  |
| <a name="output_security_group_id"></a> [security_group_id](#output_security_group_id)       | n/a                                                                                                                  |
| <a name="output_summary"></a> [summary](#output_summary)                                     | n/a                                                                                                                  |
| <a name="output_vpc_cidr"></a> [vpc_cidr](#output_vpc_cidr)                                  | n/a                                                                                                                  |
| <a name="output_vpc_id"></a> [vpc_id](#output_vpc_id)                                        | n/a                                                                                                                  |
| <a name="output_vpc_name"></a> [vpc_name](#output_vpc_name)                                  | n/a                                                                                                                  |

<!-- END_TF_DOCS -->
