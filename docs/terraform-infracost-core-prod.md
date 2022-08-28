# Terraform Infra Costing Review

## From `buildspec-terraform-infracost-core.yml`

### Running Terraform Plan

```bash
# ========================= #
#  Terraform Plan (Review)  #
# ========================= #
- terraform init
- terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
- terraform plan --out tfplan-core-prod.binary
- terraform show -json tfplan-core-prod.binary > tfplan-core-prod.json
```

### Running Infra Costing from `tfplan-core-prod.json`

```bash
# ===================== #
#  Terraform Infracost  #
# ===================== #
# ~ Infracost
- infracost breakdown --path tfplan-core-prod.json
```

![04-terraform-infracost-core-prod.png](assets/terraform/04-terraform-infracost-core-prod.png)
