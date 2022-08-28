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

### Results

```json
--- PUT JSON OUTPUT HERE ---
```
