<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version          |
| ------------------------------------------------------------------------ | ---------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.9         |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.63.0, < 4.0 |
| <a name="requirement_random"></a> [random](#requirement_random)          | >= 2.0           |

## Providers

| Name                                                      | Version          |
| --------------------------------------------------------- | ---------------- |
| <a name="provider_aws"></a> [aws](#provider_aws)          | >= 3.63.0, < 4.0 |
| <a name="provider_random"></a> [random](#provider_random) | >= 2.0           |

## Modules

| Name                                                           | Source                                                                      | Version |
| -------------------------------------------------------------- | --------------------------------------------------------------------------- | ------- |
| <a name="module_dynamodb"></a> [dynamodb](#module_dynamodb)    | ../../../../../modules/providers/aws/officials/terraform-aws-dynamodb-table | n/a     |
| <a name="module_s3_bucket"></a> [s3_bucket](#module_s3_bucket) | ../../../../../modules/providers/aws/officials/terraform-aws-s3-bucket      | n/a     |

## Resources

| Name                                                                                                                                                                                 | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                                            | resource    |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet)                                                                                | resource    |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id)                                                    | data source |
| [aws_cloudfront_log_delivery_canonical_user_id.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_log_delivery_canonical_user_id) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                                          | data source |
| [aws_kms_key.cmk_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key)                                                                        | data source |

## Inputs

| Name                                                                                                | Description                             | Type          | Default                                                                                                                                                                                                                                                | Required |
| --------------------------------------------------------------------------------------------------- | --------------------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------: |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region)                                     | AWS Region Target Deployment            | `string`      | `"ap-southeast-1"`                                                                                                                                                                                                                                     |    no    |
| <a name="input_department"></a> [department](#input_department)                                     | Department Owner                        | `string`      | `"DEVOPS"`                                                                                                                                                                                                                                             |    no    |
| <a name="input_env"></a> [env](#input_env)                                                          | Workspace Environment Selection         | `map(string)` | <pre>{<br> "lab": "lab",<br> "prod": "prod",<br> "staging": "staging"<br>}</pre>                                                                                                                                                                       |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                                  | Target Environment (tags)               | `map(string)` | <pre>{<br> "lab": "RND",<br> "prod": "PROD",<br> "staging": "STG"<br>}</pre>                                                                                                                                                                           |    no    |
| <a name="input_kms_env"></a> [kms_env](#input_kms_env)                                              | KMS Key Environment                     | `map(string)` | <pre>{<br> "lab": "RnD",<br> "prod": "Production",<br> "staging": "Staging"<br>}</pre>                                                                                                                                                                 |    no    |
| <a name="input_kms_key"></a> [kms_key](#input_kms_key)                                              | KMS Key References                      | `map(string)` | <pre>{<br> "lab": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH",<br> "prod": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH",<br> "staging": "arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/CMK_KEY_HASH"<br>}</pre> |    no    |
| <a name="input_tfstate_bucket"></a> [tfstate_bucket](#input_tfstate_bucket)                         | Name of bucket to store tfstate         | `string`      | `"devopscorner-terraform-remote-state"`                                                                                                                                                                                                                |    no    |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate_dynamodb_table](#input_tfstate_dynamodb_table) | Name of dynamodb table to store tfstate | `string`      | `"devopscorner-terraform-state-lock"`                                                                                                                                                                                                                  |    no    |
| <a name="input_tfstate_encrypt"></a> [tfstate_encrypt](#input_tfstate_encrypt)                      | Name of bucket to store tfstate         | `bool`        | `true`                                                                                                                                                                                                                                                 |    no    |
| <a name="input_tfstate_path"></a> [tfstate_path](#input_tfstate_path)                               | Path .tfstate in Bucket                 | `string`      | `"tfstate/terraform.tfstate"`                                                                                                                                                                                                                          |    no    |

## Outputs

| Name                                                                                                                 | Description                                                                                         |
| -------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| <a name="output_dynamodb_table_arn"></a> [dynamodb_table_arn](#output_dynamodb_table_arn)                            | ARN of the DynamoDB table                                                                           |
| <a name="output_dynamodb_table_id"></a> [dynamodb_table_id](#output_dynamodb_table_id)                               | ID of the DynamoDB table                                                                            |
| <a name="output_dynamodb_table_stream_arn"></a> [dynamodb_table_stream_arn](#output_dynamodb_table_stream_arn)       | The ARN of the Table Stream. Only available when var.stream_enabled is true                         |
| <a name="output_dynamodb_table_stream_label"></a> [dynamodb_table_stream_label](#output_dynamodb_table_stream_label) | A timestamp, in ISO 8601 format of the Table Stream. Only available when var.stream_enabled is true |
| <a name="output_s3_bucket_arn"></a> [s3_bucket_arn](#output_s3_bucket_arn)                                           | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.                                   |
| <a name="output_s3_bucket_id"></a> [s3_bucket_id](#output_s3_bucket_id)                                              | The name of the bucket.                                                                             |
| <a name="output_s3_bucket_region"></a> [s3_bucket_region](#output_s3_bucket_region)                                  | The AWS region this bucket resides in.                                                              |

<!-- END_TF_DOCS -->
