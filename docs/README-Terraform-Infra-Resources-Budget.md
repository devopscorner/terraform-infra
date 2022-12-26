<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version          |
| ------------------------------------------------------------------------ | ---------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.9         |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 3.63.0, < 4.0 |
| <a name="requirement_random"></a> [random](#requirement_random)          | >= 2.0           |

## Providers

| Name                                             | Version          |
| ------------------------------------------------ | ---------------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                               | Type     |
| ---------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_budgets_budget.monthly_budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget)    | resource |
| [aws_budgets_budget.monthly_forcasted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name                                                                                                | Description                             | Type          | Default                                                                          | Required |
| --------------------------------------------------------------------------------------------------- | --------------------------------------- | ------------- | -------------------------------------------------------------------------------- | :------: |
| <a name="input_aws_region"></a> [aws_region](#input_aws_region)                                     | AWS Region Target Deployment            | `string`      | `"ap-southeast-1"`                                                               |    no    |
| <a name="input_department"></a> [department](#input_department)                                     | Department Owner                        | `string`      | `"DEVOPS"`                                                                       |    no    |
| <a name="input_env"></a> [env](#input_env)                                                          | Workspace Environment Selection         | `map(string)` | <pre>{<br> "lab": "lab",<br> "prod": "prod",<br> "staging": "staging"<br>}</pre> |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                                  | Target Environment (tags)               | `map(string)` | <pre>{<br> "lab": "RND",<br> "prod": "PROD",<br> "staging": "STG"<br>}</pre>     |    no    |
| <a name="input_tfstate_bucket"></a> [tfstate_bucket](#input_tfstate_bucket)                         | Name of bucket to store tfstate         | `string`      | `"devopscorner-terraform-remote-state"`                                          |    no    |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate_dynamodb_table](#input_tfstate_dynamodb_table) | Name of dynamodb table to store tfstate | `string`      | `"devopscorner-terraform-state-lock"`                                            |    no    |
| <a name="input_tfstate_encrypt"></a> [tfstate_encrypt](#input_tfstate_encrypt)                      | Name of bucket to store tfstate         | `bool`        | `true`                                                                           |    no    |
| <a name="input_tfstate_path"></a> [tfstate_path](#input_tfstate_path)                               | Path .tfstate in Bucket                 | `string`      | `"resources/budget/terraform.tfstate"`                                           |    no    |

## Outputs

| Name                                                                                                                             | Description |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_billing_monthly_billing_info"></a> [billing_monthly_billing_info](#output_billing_monthly_billing_info)          | n/a         |
| <a name="output_billing_monthly_billing_notif"></a> [billing_monthly_billing_notif](#output_billing_monthly_billing_notif)       | n/a         |
| <a name="output_billing_monthly_forcasted_info"></a> [billing_monthly_forcasted_info](#output_billing_monthly_forcasted_info)    | n/a         |
| <a name="output_billing_monthly_forcasted_notif"></a> [billing_monthly_forcasted_notif](#output_billing_monthly_forcasted_notif) | n/a         |

<!-- END_TF_DOCS -->
