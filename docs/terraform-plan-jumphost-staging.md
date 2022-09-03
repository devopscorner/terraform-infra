## From `buildspec-terraform-jumphost-plan.yml`

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

![00-terraform-plan-jumphost-staging-p1.png](assets/terraform/00-terraform-plan-jumphost-staging-p1.png)
![00-terraform-plan-jumphost-staging-p2.png](assets/terraform/00-terraform-plan-jumphost-staging-p2.png)

### Results

```json
--- PUT JSON OUTPUT HERE ---
```
