# Terraform SFTPLab

## How-to-Deploy

- Terraform Initialize

  ```
  terraform init
  ```

- List Existing SFTPLab

  ```
  terraform sftplab list
  ```

- Create SFTPLab

  ```
  terraform sftplab new [environment]
  ---
  eg:
  terraform sftplab new lab
  terraform sftplab new staging
  terraform sftplab new prod
  ```

- Use SFTPLab

  ```
  terraform sftplab select [environment]
  ---
  eg:
  terraform sftplab select lab
  terraform sftplab select staging
  terraform sftplab select prod
  ```

- Terraform Planning

  ```
  terraform plan
  ```

- Terraform Provisioning

  ```
  terraform apply
  ```

## Migrate State

- Rename Backend

  ```
  mv backend.tf.example backend.tf
  ```

- Initiate Migrate

  ```
  terraform init --migrate-state
  ```

## Cleanup Environment

```
terraform destroy
```

## Copyright

- Author: **Dwi Fahni Denni (@zeroc0d3)**
- Vendor: **DevOps Corner Indonesia (devopscorner.id)**
- License: **Apache v2**
