# Security Analysis for Terraform Plan

## From `buildspec-terraform-scan.yml`

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

### Running Checkov from `tfplan-core-staging.json`

```bash
# =================== #
#  Terraform Checkov  #
# =================== #
# ~ Checkov
- checkov -f tfplan-core-staging.json
```

### Terraform Scan

![01-terraform-checkov-core-staging-p1.png](assets/terraform/01-terraform-checkov-core-staging-p1.png)
![01-terraform-checkov-core-staging-p2.png](assets/terraform/01-terraform-checkov-core-staging-p2.png)

```bash
# =================== #
#  Terraform Checkov  #
# =================== #
# Skip scan policies
# Refences: https://www.checkov.io/5.Policy%20Index/all.html
- checkov -f tfplan-core-staging.json --skip-check CKV_AWS_20,CKV_AWS_24,CKV_AWS_130,CKV2_AWS_5,CKV2_AWS_11,CKV2_AWS_12,CKV2_AWS_19
```

### Terraform Scan Skip Policy

![01-terraform-checkov-skip-core-staging.png](assets/terraform/01-terraform-checkov-skip-core-staging.png)

### Running Alternative Checkov from `tfplan-core-staging.json`

```bash
# ===================== #
#  Terraform Terrascan  #
# ===================== #
# ~ Terrascan ~
- terrascan init
- terrascan scan -o human
```

![02-terraform-terrascan-core-staging-p1.png](assets/terraform/02-terraform-terrascan-core-staging-p1.png)
![02-terraform-terrascan-core-staging-p2.png](assets/terraform/02-terraform-terrascan-core-staging-p2.png)

```bash
# ================== #
#  Terraform TFSec   #
# ================== #
# ~ Tfsec ~
- tfsec .
```

![03-terraform-tfsec-core-staging-p1.png](assets/terraform/03-terraform-tfsec-core-staging-p1.png)
![03-terraform-tfsec-core-staging-p2.png](assets/terraform/03-terraform-tfsec-core-staging-p2.png)
