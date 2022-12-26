<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ../../../../../../../modules/providers/aws/officials/terraform-aws-rds | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.db_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_route53_record.emrdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.rds_default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_kms_key.cmk_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.core_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_az"></a> [aws\_az](#input\_aws\_az) | AWS Zone Target Deployment | `map(string)` | <pre>{<br>  "lab": "ap-southeast-1a",<br>  "prod": "ap-southeast-1a",<br>  "staging": "ap-southeast-1a"<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Target Deployment | `string` | `"ap-southeast-1"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | ------------------------------------ RDS ------------------------------------ | `map(string)` | <pre>{<br>  "lab": "db.t3.small",<br>  "prod": "db.t3.large",<br>  "staging": "db.t3.medium"<br>}</pre> | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_dns_url"></a> [dns\_url](#input\_dns\_url) | n/a | `map(string)` | <pre>{<br>  "lab": "devopscorner.online",<br>  "prod": "devopscorner.online",<br>  "staging": "devopscorner.online"<br>}</pre> | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | ------------------------------------ DNS (Private) ------------------------------------ | `map(string)` | <pre>{<br>  "lab": "ZONE_ID",<br>  "prod": "ZONE_ID",<br>  "staging": "ZONE_ID"<br>}</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br>  "lab": "RnD",<br>  "prod": "Production",<br>  "staging": "Staging"<br>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br>  "lab": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH",<br>  "prod": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH",<br>  "staging": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH"<br>}</pre> | no |
| <a name="input_rds_engine"></a> [rds\_engine](#input\_rds\_engine) | RDS Engine DBMS | `string` | `"postgres"` | no |
| <a name="input_rds_family"></a> [rds\_family](#input\_rds\_family) | RDS Family Version DBMS | `string` | `"postgres14"` | no |
| <a name="input_rds_major_engine_version"></a> [rds\_major\_engine\_version](#input\_rds\_major\_engine\_version) | RDS Initial Version DBMS | `string` | `"14"` | no |
| <a name="input_rds_name"></a> [rds\_name](#input\_rds\_name) | RDS Name | `string` | `"LARAVELDB-PSQL"` | no |
| <a name="input_rds_storage_size"></a> [rds\_storage\_size](#input\_rds\_storage\_size) | n/a | `map(number)` | <pre>{<br>  "lab": 50,<br>  "prod": 100,<br>  "staging": 100<br>}</pre> | no |
| <a name="input_rds_version"></a> [rds\_version](#input\_rds\_version) | RDS Version DBMS | `string` | `"14.1"` | no |
| <a name="input_retention_db"></a> [retention\_db](#input\_retention\_db) | n/a | `map(number)` | <pre>{<br>  "lab": 3,<br>  "prod": 7,<br>  "staging": 3<br>}</pre> | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-terraform-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-terraform-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"resources/rds/terraform.tfstate"` | no |
| <a name="input_vpc_list"></a> [vpc\_list](#input\_vpc\_list) | n/a | `list(string)` | <pre>{<br>  "lab": "vpc-1234567890",<br>  "prod": "vpc-0987654321",<br>  "staging": "vpc-1234567890"<br>}</pre> | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | n/a | `map(any)` | <pre>{<br>  "lab": {<br>    "Department": "DEVOPS",<br>    "DepartmentGroup": "LAB-DEVOPS",<br>    "Environment": "LAB",<br>    "Name": "devopscorner-terraform-lab-vpc",<br>    "ResourceGroup": "LAB-VPC"<br>  },<br>  "prod": {<br>    "Department": "DEVOPS",<br>    "DepartmentGroup": "PROD-DEVOPS",<br>    "Environment": "PROD",<br>    "Name": "devopscorner-terraform-prod-vpc",<br>    "ResourceGroup": "PROD-VPC"<br>  },<br>  "staging": {<br>    "Department": "DEVOPS",<br>    "DepartmentGroup": "STG-DEVOPS",<br>    "Environment": "STAGING",<br>    "Name": "devopscorner-terraform-staging-vpc",<br>    "ResourceGroup": "STG-VPC"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The RDS instance ID |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | The database password |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
<!-- END_TF_DOCS -->