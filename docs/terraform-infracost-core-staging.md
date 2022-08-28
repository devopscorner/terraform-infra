# Terraform Infra Costing Review

## From `buildspec-terraform-infracost-core.yml`

### Running Terraform Plan

```bash
# ========================= #
#  Terraform Plan (Review)  #
# ========================= #
- terraform init
- terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
- terraform plan --out tfplan-core-staging.binary
- terraform show -json tfplan-core-staging.binary > tfplan-core-staging.json
```

### Running Infra Costing from `tfplan-core-staging.json`

```bash
# ===================== #
#  Terraform Infracost  #
# ===================== #
# ~ Infracost
- infracost breakdown --path tfplan-core-staging.json
```

![04-terraform-infracost-core-staging.png](assets/terraform/04-terraform-infracost-core-staging.png)
