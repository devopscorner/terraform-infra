## Terraform EKS Provisioning

### Prerequirements

- Terrafom Provider EKS
  ```
  terraform init
  ```

### Planning

- Review Script
  ```
  terraform validate
  ```

- Planning
  ```
  terraform plan
  ```

- Planning Outputs (File)
  ```
  terraform plan -out=terraform.plan
  ```

- Planning Outputs (JSON)
  ```
  terraform show -json terraform.plan | jq > terraform.plan.json
  ```

### Execution

- Apply Changes
  ```
  terraform apply
  ```

- Apply Changes from File
  ```
  terraform apply "terraform.plan"
  ```

### Clean-Up

- Destroy Environment
  ```
  terraform destroy
  ```
