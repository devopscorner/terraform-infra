## From `buildspec-terraform-eks-plan.yml`

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

![00-terraform-plan-eks-prod-p1.png](assets/terraform/00-terraform-plan-eks-prod-p1.png)

### Results

```json
--- PUT JSON OUTPUT HERE ---
```
