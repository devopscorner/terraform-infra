# Terraform Infra Costing Review

## From `buildspec-terraform-infracost-eks.yml`

### Running Terraform Plan

```bash
# ========================= #
#  Terraform Plan (Review)  #
# ========================= #
- terraform init
- terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
- terraform plan --out tfplan-eks-prod.binary
- terraform show -json tfplan-eks-prod.binary > tfplan-eks-prod.json
```

### Running Infra Costing from `tfplan-eks-prod.json`

```bash
# ===================== #
#  Terraform Infracost  #
# ===================== #
# ~ Infracost
- infracost breakdown --path tfplan-eks-prod.json
```

![04-terraform-infracost-eks-prod.png](assets/terraform/04-terraform-infracost-eks-prod.png)
