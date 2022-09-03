# Security Analysis for Terraform Plan

## From `buildspec-terraform-scan.yml`

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

### Running Checkov from `tfplan-jumphost-staging.json`

```bash
# =================== #
#  Terraform Checkov  #
# =================== #
# ~ Checkov
- checkov -f tfplan-jumphost-staging.json
```

### Terraform Scan

![01-terraform-checkov-jumphost-staging-p1.png](assets/terraform/01-terraform-checkov-jumphost-staging-p1.png)
![01-terraform-checkov-jumphost-staging-p2.png](assets/terraform/01-terraform-checkov-jumphost-staging-p2.png)

### Terraform Scan Skip Policy

```bash
# =================== #
#  Terraform Checkov  #
# =================== #
# Skip scan policies
# Refences: https://www.checkov.io/5.Policy%20Index/all.html
- checkov -f tfplan-jumphost-staging.json --skip-check CKV_AWS_19,CKV_AWS_20,CKV_AWS_24,CKV_AWS_25,CKV_AWS_38,CKV_AWS_39,CKV_AWS_58,CKV_AWS_79,CKV_AWS_130,CKV_AWS_135,CKV_AWS_144,CKV_AWS_145,CKV_AWS_260,CKV_AWS_261,CKV2_AWS_5,CKV2_AWS_6,CKV2_AWS_11,CKV2_AWS_12,CKV2_AWS_19
```

![01-terraform-checkov-skip-jumphost-staging-p1.png](assets/terraform/01-terraform-checkov-skip-jumphost-staging-p1.png)
![01-terraform-checkov-skip-jumphost-staging-p2.png](assets/terraform/01-terraform-checkov-skip-jumphost-staging-p2.png)

### Running Alternative Checkov from `tfplan-jumphost-staging.json`

```bash
# ===================== #
#  Terraform Terrascan  #
# ===================== #
# ~ Terrascan ~
- terrascan init
- terrascan scan -o human
```

![02-terraform-terrascan-jumphost-staging-p1.png](assets/terraform/02-terraform-terrascan-jumphost-staging-p1.png)
![02-terraform-terrascan-jumphost-staging-p2.png](assets/terraform/02-terraform-terrascan-jumphost-staging-p2.png)

```bash
# ================== #
#  Terraform TFSec   #
# ================== #
# ~ Tfsec ~
- tfsec .
```

![03-terraform-tfsec-jumphost-staging-p1.png](assets/terraform/03-terraform-tfsec-jumphost-staging-p1.png)
![03-terraform-tfsec-jumphost-staging-p2.png](assets/terraform/03-terraform-tfsec-jumphost-staging-p2.png)
