# Terraform Infra

![all contributors](https://img.shields.io/github/contributors/devopscorner/terraform-infra)
![tags](https://img.shields.io/github/v/tag/devopscorner/terraform-infra?sort=semver)
[![docker pulls](https://img.shields.io/docker/pulls/devopscorner/cicd.svg)](https://hub.docker.com/r/devopscorner/cicd/)
[![docker image size](https://img.shields.io/docker/image-size/devopscorner/cicd.svg?sort=date)](https://hub.docker.com/r/devopscorner/cicd/)
![download all](https://img.shields.io/github/downloads/devopscorner/terraform-infra/total.svg)
![view](https://views.whatilearened.today/views/github/devopscorner/terraform-infra.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://github.com/devopscorner/terraform-infra/blob/master/clone.json?raw=True&logo=github)
![issues](https://img.shields.io/github/issues/devopscorner/terraform-infra)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/terraform-infra)
![forks](https://img.shields.io/github/forks/devopscorner/terraform-infra)
![stars](https://img.shields.io/github/stars/devopscorner/terraform-infra)
[![license](https://img.shields.io/github/license/devopscorner/terraform-infra)](https://img.shields.io/github/license/devopscorner/terraform-infra)

Production Grade Terraform for Provisioning Infrastructure

## Prerequirements

- Docker (`docker`)
- Docker Compose (`docker-compose`)
- AWS Cli version 2 (`aws`)
- Terraform Cli (`terraform`)
- Terraform Environment (`tfenv`)

## Build Container CI/CD

- Clone Repository DevOpsCorner-CICD

  ```
  git clone https://github.com/devopscorner/devopscorner-container.git
  ```

- Replace "YOUR_AWS_ACCOUNT" with your AWS ACCOUNT ID

  ```
  find ./ -type f -exec sed -i 's/YOUR_AWS_ACCOUNT/123456789012/g' {} \;
  ```

- Build Container CI/CD (Ubuntu)

  ```
  cd compose/docker/cicd-ubuntu
  docker build . -t devopscorner-cicd:ubuntu
  -- or --
  make build-cicd-ubuntu
  ```

- Build Container CI/CD (Alpine)

  ```
  cd compose/docker/cicd-alpine
  docker build . -t devopscorner-cicd:alpine
  -- or --
  make build-cicd-alpine
  ```

- Add Your Container Image Path in ECR
- Push Container CI/CD to ECR
  - ECR Login

    ```
    aws ecr get-login-password --region [AWS_REGION] | docker login --username AWS --password-stdin [ECR_PATH]

    ---

    aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com
    ```

  - ECR Build

    - Example:

      ```
      # Ubuntu

      docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:ubuntu YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:latest

      # Alpine

      docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:alpine YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:latest
      ```

    - With Script:

      ```
      make ecr-tag-ubuntu ARGS=YOUR_AWS_ACCOUNT
      make ecr-tag-alpine ARGS=YOUR_AWS_ACCOUNT
      ```

  - ECR Push

    - Example:

      ```
      # Ubuntu

      docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:ubuntu

      # Alpine

      docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:alpine
      ```

    - With Script:

      ```
      make ecr-push-ubuntu ARGS=YOUR_AWS_ACCOUNT
      make ecr-push-alpine ARGS=YOUR_AWS_ACCOUNT
      ```

## Terraform Resource Infra

- Clone this repository

  ```
  git clone https://github.com/devopscorner/terraform-infra.git
  ```

- Get Terraform Modules
  - Officials

    ```
    ./get-officials.sh
    -- or --
    make sub-officials
    ```

  - Community

    ```
    ./get-community.sh
    -- or --
    make sub-community
    ```

  - Get All Modules (Officials & Community)

    ```
    make sub-all
    ```

- Provisioning your Infra (non existing infrastructure)
  - Goto `terraform/environment/providers/aws/infra`

    ```
    cd core
    terraform init
    terraform workspace select staging
    terraform plan
    terraform apply
    ```

- Provisioning your Terraform State (Remote State)
  - Goto `terraform/environment/providers/aws/tfstate`

    ```
    cd core
    terraform init
    terraform workspace select staging
    terraform plan
    terraform apply
    ```

- Provisioning Infra Resources
  - Goto `terraform/environment/providers/aws/infra/resources`
    - Budget

      ```
      cd budget
      ```

    - RDS (database)

      ```
      cd rds
      ```

    - Cloud9

      ```
      cd cloud9
      ```

    - Amazon Managed Kubernetes Service (EKS)

      ```
      cd eks
      ```

    - Amazon Elastic Map Reduce (EMR)

      ```
      cd emr
      ```

    - Amazon Managed Workflows for Apache Airflow (MWAA)

      ```
      cd mwaa
      ```

  - Running Terraform

    ```
    terraform init
    terraform workspace select staging
    terraform plan
    terraform apply
    ```

## Terraform Resource Infra - Inside Container

- ECR Build

  - Example:

      ```
      # Alpine

      docker build . -t YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine
      ```

  - With Script:

      ```
      make ecr-build-alpine ARGS=YOUR_AWS_ACCOUNT
      ```

- ECR Tag

  - Example:

      ```
      # Alpine

      docker tag YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/cicd:latest
      ```

  - With Script:

      ```
      make ecr-tag-alpine ARGS=YOUR_AWS_ACCOUNT
      ```

- ECR Push

  - Example:

      ```
      # Alpine

      docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:alpine

      # Latest (Alpine)

      docker push YOUR_AWS_ACCOUNT.dkr.ecr.ap-southeast-1.amazonaws.com/devopscorner/terraform-infra:latest
      ```

  - With Script:

      ```
      make ecr-push-alpine ARGS=YOUR_AWS_ACCOUNT
      ```

## Using Cloud9 IDE

- Provisioning Cloud9 in EC2 onspot Instances

  ```
  aws cloud9 create-environment-ec2 --name example-env --description "environment" --instance-type t3.small --subnet-id subnet-id --automatic-stop-time-minutes 60 --owner-arn arn:aws:iam::123:user/User

  -- or --

  Go to `terraform/environment/providers/aws/infra/resources/cloud9` folder

  terraform init
  terraform workspace select staging
  terraform plan
  terraform apply
  ```

- Bootstrap CI/CD Tools Inside IDE

  ```
  git clone https://github.com/devopscorner/terraform-infra.git
  make sub-all
  make tf-core-apply
  make tf-infra-apply
  ```

## Cleanup

- Destroy Environment Lab

  ```
  terraform destroy
  ```

## Tested Environment

### Versioning

- Docker version

  ```
  docker version

  Client:
  Cloud integration: v1.0.22
  Version:           20.10.12
  API version:       1.41
  Go version:        go1.16.12
  Git commit:        e91ed57
  Built:             Mon Dec 13 11:46:56 2021
  OS/Arch:           darwin/amd64
  Context:           default
  Experimental:      true
  ```

- Docker-Compose version

  ```
  docker-compose -v
  ---
  Docker Compose version v2.2.3
  ```

- AWS Cli

  ```
  aws -v
  ---
  Note: AWS CLI version 2, the latest major version of the AWS CLI, is now stable and recommended for general use. For more information, see the AWS CLI version 2 installation instructions at: <https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html>
  ```

- Terraform Cli

  ```
  terraform version
  ---
  Terraform v1.1.6
  on darwin_amd64
  - provider registry.terraform.io/hashicorp/aws v3.74.3
  - provider registry.terraform.io/hashicorp/local v2.1.0
  - provider registry.terraform.io/hashicorp/null v3.1.0
  - provider registry.terraform.io/hashicorp/random v3.1.0
  - provider registry.terraform.io/hashicorp/time v0.7.2
  ```

- Terraform Environment Cli

  ```
  tfenv -v
  ---
  tfenv 2.2.2
  ```

## Security Check

Make sure that you didn't push sensitive information in this repository

- [ ] AWS Credentials (AWS_ACCESS_KEY, AWS_SECRET_KEY)
- [ ] AWS Account ID
- [ ] AWS Resources ARN
- [ ] Username & Password
- [ ] Private (id_rsa) & Public Key (id_rsa.pub)
- [ ] DNS Zone ID
- [ ] APP & API Key

## Copyright

- Author: **Dwi Fahni Denni (@zeroc0d3)**
- Vendor: **DevOps Corner Indonesia (devopscorner.id)**
- License: **Apache v2**
