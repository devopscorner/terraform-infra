# Terraform Infra Costing Review

## From `buildspec-terraform-infracost-jumphost.yml`

### Running Terraform Plan

```bash
# ========================= #
#  Terraform Plan (Review)  #
# ========================= #
- terraform init
- terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
- terraform plan --out tfplan-jumphost-prod.binary
- terraform show -json tfplan-jumphost-prod.binary > tfplan-jumphost-prod.json
```

### Running Infra Costing from `tfplan-jumphost-prod.json`

```bash
# ===================== #
#  Terraform Infracost  #
# ===================== #
# ~ Infracost
- infracost breakdown --path tfplan-jumphost-prod.json
```

![04-terraform-infracost-jumphost-prod.png](assets/terraform/04-terraform-infracost-jumphost-prod.png)
