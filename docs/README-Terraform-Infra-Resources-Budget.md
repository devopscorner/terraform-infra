<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63.0, < 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63.0, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.monthly_budget](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |
| [aws_budgets_budget.monthly_forcasted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/budgets_budget) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Target Deployment | `string` | `"ap-southeast-1"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_env"></a> [env](#input\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-terraform-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-terraform-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"resources/budget/terraform.tfstate"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_monthly_billing_info"></a> [billing\_monthly\_billing\_info](#output\_billing\_monthly\_billing\_info) | n/a |
| <a name="output_billing_monthly_billing_notif"></a> [billing\_monthly\_billing\_notif](#output\_billing\_monthly\_billing\_notif) | n/a |
| <a name="output_billing_monthly_forcasted_info"></a> [billing\_monthly\_forcasted\_info](#output\_billing\_monthly\_forcasted\_info) | n/a |
| <a name="output_billing_monthly_forcasted_notif"></a> [billing\_monthly\_forcasted\_notif](#output\_billing\_monthly\_forcasted\_notif) | n/a |
<!-- END_TF_DOCS -->