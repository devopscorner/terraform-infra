## Output

```
terraform output
-----

--- PUT JSON OUTPUT HERE ---
```

## State List

```
terraform state list
-----
data.aws_caller_identity.current
data.aws_canonical_user_id.current
data.aws_cloudfront_log_delivery_canonical_user_id.cloudfront
data.aws_iam_policy_document.eks_bucket_policy
data.aws_kms_key.cmk_key
data.aws_vpc.selected
data.terraform_remote_state.core_state
data.tls_certificate.cluster
aws_eks_cluster.aws_eks
aws_eks_node_group.devops["monitoring"]
aws_eks_node_group.devops["tools"]
aws_eks_node_group.goapp["prod"]
aws_eks_node_group.sharedredis["prod"]
aws_iam_openid_connect_provider.cluster
aws_iam_policy.route53_cert_policy
aws_iam_role.cluster_autoscaler_role
aws_iam_role.eks_cluster
aws_iam_role.eks_nodes
aws_iam_role.iam_eks_bucket_profile
aws_iam_role_policy.aws_loadbalancer_controller
aws_iam_role_policy.cluster_autoscaler_policy
aws_iam_role_policy.node_autoscaler_policy
aws_iam_role_policy_attachment.eks_iam_cluster_policy
aws_iam_role_policy_attachment.eks_iam_cni_policy
aws_iam_role_policy_attachment.eks_iam_container_registry_policy
aws_iam_role_policy_attachment.eks_iam_service_policy
aws_iam_role_policy_attachment.eks_iam_worker_node_policy
aws_iam_role_policy_attachment.route53_cert_policy
aws_lb_target_group.devops["monitoring"]
aws_lb_target_group.devops["tools"]
aws_lb_target_group.goapp["prod"]
aws_lb_target_group.sharedredis["prod"]
aws_security_group.eks_sg
null_resource.eks_cluster_autoscaler_role
random_pet.this
module.s3_bucket.data.aws_iam_policy_document.combined[0]
module.s3_bucket.data.aws_iam_policy_document.deny_insecure_transport[0]
module.s3_bucket.data.aws_iam_policy_document.require_latest_tls[0]
module.s3_bucket.aws_s3_bucket.this[0]
module.s3_bucket.aws_s3_bucket_ownership_controls.this[0]
module.s3_bucket.aws_s3_bucket_policy.this[0]
module.s3_bucket.aws_s3_bucket_public_access_block.this[0]
```
