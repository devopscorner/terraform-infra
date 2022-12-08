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
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ../../../../../../modules/providers/aws/officials/terraform-aws-s3-bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.aws_eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.laravel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.route53_cert_policy_dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.route53_cert_policy_uat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cluster_autoscaler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.iam_eks_bucket_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.aws_loadbalancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cluster_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.node_autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.eks_iam_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_container_registry_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_iam_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.route53_cert_policy_dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.route53_cert_policy_uat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb_target_group.laravel](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.eks_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [null_resource.eks_cluster_autoscaler_role](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_canonical_user_id.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/canonical_user_id) | data source |
| [aws_cloudfront_log_delivery_canonical_user_id.cloudfront](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudfront_log_delivery_canonical_user_id) | data source |
| [aws_iam_policy_document.eks_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_kms_key.cmk_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [terraform_remote_state.core_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [tls_certificate.cluster](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_my_ip"></a> [access\_my\_ip](#input\_access\_my\_ip) | Your IP Address | `string` | `"118.136.0.0/16"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Target Deployment | `string` | `"ap-southeast-1"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket Name | `string` | `"devopscorner-eks"` | no |
| <a name="input_department"></a> [department](#input\_department) | Department Owner | `string` | `"DEVOPS"` | no |
| <a name="input_dns_url"></a> [dns\_url](#input\_dns\_url) | n/a | `map(string)` | <pre>{<br>  "lab": "devopscorner.lab",<br>  "prod": "devopscorner.id",<br>  "staging": "awscb.id"<br>}</pre> | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | ------------------------------------ DNS (Public) ------------------------------------ | `map(string)` | <pre>{<br>  "dev": "ZONE-ID-DEV",<br>  "lab": "ZONE-ID-LAB",<br>  "prod": "ZONE-ID-PROD",<br>  "staging": "ZONE-ID-STAGING",<br>  "uat": "ZONE-ID-UAT"<br>}</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | default cluster name | `string` | `"devopscorner"` | no |
| <a name="input_eks_name_env"></a> [eks\_name\_env](#input\_eks\_name\_env) | n/a | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_env"></a> [env](#input\_env) | Workspace Environment Selection | `map(string)` | <pre>{<br>  "lab": "lab",<br>  "prod": "prod",<br>  "staging": "staging"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Target Environment (tags) | `map(string)` | <pre>{<br>  "lab": "RND",<br>  "prod": "PROD",<br>  "staging": "STG"<br>}</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `map(string)` | <pre>{<br>  "lab": "1.22",<br>  "prod": "1.22",<br>  "staging": "1.22"<br>}</pre> | no |
| <a name="input_kms_env"></a> [kms\_env](#input\_kms\_env) | KMS Key Environment | `map(string)` | <pre>{<br>  "lab": "RnD",<br>  "prod": "Production",<br>  "staging": "Staging"<br>}</pre> | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS Key References | `map(string)` | <pre>{<br>  "lab": "arn:aws:kms:ap-southeast-1:085546766396:key/8fddd0c2-2cab-43e6-9858-0007d2e41b4b",<br>  "prod": "arn:aws:kms:ap-southeast-1:085546766396:key/8fddd0c2-2cab-43e6-9858-0007d2e41b4b",<br>  "staging": "arn:aws:kms:ap-southeast-1:085546766396:key/8fddd0c2-2cab-43e6-9858-0007d2e41b4b"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Zone Target Deployment | `map(string)` | <pre>{<br>  "lab": "ap-southeast-1",<br>  "prod": "ap-southeast-1",<br>  "staging": "ap-southeast-1"<br>}</pre> | no |
| <a name="input_ssh_key_pair"></a> [ssh\_key\_pair](#input\_ssh\_key\_pair) | default keyname | `map(string)` | <pre>{<br>  "lab": "devopscorner-deploy-lab",<br>  "prod": "devopscorner-deploy-prod",<br>  "staging": "devopscorner-deploy-staging"<br>}</pre> | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | SSH Public Key | `string` | `""` | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | Name of bucket to store tfstate | `string` | `"devopscorner-terraform-remote-state"` | no |
| <a name="input_tfstate_dynamodb_table"></a> [tfstate\_dynamodb\_table](#input\_tfstate\_dynamodb\_table) | Name of dynamodb table to store tfstate | `string` | `"devopscorner-terraform-state-lock"` | no |
| <a name="input_tfstate_encrypt"></a> [tfstate\_encrypt](#input\_tfstate\_encrypt) | Name of bucket to store tfstate | `bool` | `true` | no |
| <a name="input_tfstate_path"></a> [tfstate\_path](#input\_tfstate\_path) | Path .tfstate in Bucket | `string` | `"resources/eks/terraform.tfstate"` | no |
| <a name="input_vpn_infra"></a> [vpn\_infra](#input\_vpn\_infra) | VPN Infra | `map(string)` | <pre>{<br>  "lab": "sg-1234567890",<br>  "prod": "sg-0987654321",<br>  "staging": "sg-1234567890"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | -------------------------------------------------------------------------- EKS Config Map Auth -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_certificat_authority"></a> [eks\_cluster\_certificat\_authority](#output\_eks\_cluster\_certificat\_authority) | -------------------------------------------------------------------------- EKS Cluster Certificate Authority -------------------------------------------------------------------------- |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | -------------------------------------------------------------------------- EKS Cluster Endpoint -------------------------------------------------------------------------- |
| <a name="output_eks_node_name_laravel_dev"></a> [eks\_node\_name\_laravel\_dev](#output\_eks\_node\_name\_laravel\_dev) | -------------------------------------------------------------------------- Node Group Output -------------------------------------------------------------------------- # DEV Output ## |
| <a name="output_eks_node_name_laravel_uat"></a> [eks\_node\_name\_laravel\_uat](#output\_eks\_node\_name\_laravel\_uat) | # UAT Output ## |
| <a name="output_eks_node_tg_laravel_dev"></a> [eks\_node\_tg\_laravel\_dev](#output\_eks\_node\_tg\_laravel\_dev) | -------------------------------------------------------------------------- Target Group Output -------------------------------------------------------------------------- # DEV Output ## |
| <a name="output_eks_node_tg_laravel_uat"></a> [eks\_node\_tg\_laravel\_uat](#output\_eks\_node\_tg\_laravel\_uat) | # UAT Output ## |
| <a name="output_eks_security_group"></a> [eks\_security\_group](#output\_eks\_security\_group) | -------------------------------------------------------------------------- EKS Security Group -------------------------------------------------------------------------- |
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | -------------------------------------------------------------------------- EKS VPC -------------------------------------------------------------------------- |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | -------------------------------------------------------------------------- EKS Kube Config -------------------------------------------------------------------------- |
<!-- END_TF_DOCS -->