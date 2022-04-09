# Terraform Infra

![all contributors](https://img.shields.io/github/contributors/devopscorner/terraform-infra)
![tags](https://img.shields.io/github/v/tag/devopscorner/terraform-infra?sort=semver)
[![docker pulls](https://img.shields.io/docker/pulls/devopscorner/cicd.svg)](https://hub.docker.com/r/devopscorner/cicd/)
[![docker image size](https://img.shields.io/docker/image-size/devopscorner/cicd.svg?sort=date)](https://hub.docker.com/r/devopscorner/cicd/)
![download all](https://img.shields.io/github/downloads/devopscorner/terraform-infra/total.svg)
![download latest](https://img.shields.io/github/downloads/devopscorner/terraform-infra/1.0/total)
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

## Documentation

- Read [this](./docs/README.md)

## Terraform Features

Multi Environment Workspace:

- Remote State Terraform (S3 & DynamoDB)

- Core Infrastructure
  - VPC
  - Subnet EC2 & EKS
  - Security Group
  - NAT Gateway
  - Internet Gateway
  - VPC Peers Single CIDR
  - VPC Peers Multi CIDR

- Resources Other Infra
  - Budget
  - Cloud9 IDE
  - AWS Elastic Computing (EC2)
    - Airflow
    - Jumphost
    - PostgreSQL (PSQL)
  - Amazon Managed Kubernetes Service (EKS)
  - Amazon Elastic Map Reduce (EMR)
  - Amazon Managed Workflows for Apache Airflow (MWAA)
  - Amazon Relational Database Service (RDS)
  - Amazon ElastiCache for Redis

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
