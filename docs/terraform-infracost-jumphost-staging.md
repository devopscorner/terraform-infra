# Terraform Infra Costing Review

## From `buildspec-terraform-infracost-jumphost.yml`

### Running Terraform Plan

```bash
# ========================= #
#  Terraform Plan (Review)  #
# ========================= #
- terraform init
- terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
- terraform plan --out tfplan-jumphost-staging.binary
- terraform show -json tfplan-jumphost-staging.binary > tfplan-jumphost-staging.json
```

### Running Infra Costing from `tfplan-jumphost-staging.json`

```bash
# ===================== #
#  Terraform Infracost  #
# ===================== #
# ~ Infracost
- infracost breakdown --path tfplan-jumphost-staging.json
```

![04-terraform-infracost-jumphost-staging.png](assets/terraform/04-terraform-infracost-jumphost-staging.png)
