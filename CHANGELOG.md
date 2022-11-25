# Terraform Infra

Production Grade Terraform for Provisioning Infrastructure

![all contributors](https://img.shields.io/github/contributors/devopscorner/terraform-infra)
![tags](https://img.shields.io/github/v/tag/devopscorner/terraform-infra?sort=semver)
[![docker pulls](https://img.shields.io/docker/pulls/devopscorner/terraform-infra.svg)](https://hub.docker.com/r/devopscorner/terraform-infra/)
![download all](https://img.shields.io/github/downloads/devopscorner/terraform-infra/total.svg)
![view](https://views.whatilearened.today/views/github/devopscorner/terraform-infra.svg)
![clone](https://img.shields.io/badge/dynamic/json?color=success&label=clone&query=count&url=https://raw.githubusercontent.com/devopscorner/terraform-infra/master/clone.json?raw=True&logo=github)
![issues](https://img.shields.io/github/issues/devopscorner/terraform-infra)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/terraform-infra)
![forks](https://img.shields.io/github/forks/devopscorner/terraform-infra)
![stars](https://img.shields.io/github/stars/devopscorner/terraform-infra)
[![license](https://img.shields.io/github/license/devopscorner/terraform-infra)](https://img.shields.io/github/license/devopscorner/terraform-infra)

---
## Version 3.4

### Features

- Added EKS node, autoscale & taggination for Laravel Framework
- Added RDS node for LaravelDB
- Added EC2 resources for Nifi

---
## Version 3.3

### Features

- All features from version 3.2
- Added zone c in Core Infra
- Refactoring resources EKS with zone c capabilities
- Refactoring CIDR range VPC
- Refactoring subnet ip range class
- Added Documentation Terraform Infra
  - Build Container `devopscorner/cicd`
    - Build Container `devopscorner/cicd` for DockerHub, detail [here](https://github.com/devopscorner/devopscorner-container/blob/master/docs/container-cicd-dockerhub.md)
    - Build Container `devopscorner/cicd` for ECR, detail [here](https://github.com/devopscorner/devopscorner-container/blob/master/docs/container-cicd-ecr.md)

  - Build Container `devopscorner/terraform-infra`
    - Build Container `devopscorner/terraform-infra` for DockerHub, detail [here](docs/container-terraform-infra-dockerhub.md)
    - Build Container `devopscorner/terraform-infra` for ECR, detail [here](docs/container-terraform-infra-ecr.md)

  - Terraform Plan Inventory
    - [Terraform Plan - Core Staging](docs/terraform-plan-core-staging.md)
    - [Terraform Plan - Core Prod](docs/terraform-plan-core-prod.md)
    - [Terraform Plan - Jumphost Staging](docs/terraform-plan-jumphost-staging.md)
    - [Terraform Plan - Jumphost Prod](docs/terraform-plan-jumphost-prod.md)
    - [Terraform Plan - EKS Staging](docs/terraform-plan-eks-staging.md)
    - [Terraform Plan - EKS Prod](docs/terraform-plan-eks-prod.md)
    - [Terraform Security Analysis - Core Staging](docs/terraform-security-analysis-core-staging.md)
    - [Terraform Security Analysis - Core Prod](docs/terraform-security-analysis-core-prod.md)
    - [Terraform Security Analysis - Jumphost Staging](docs/terraform-security-analysis-jumphost-staging.md)
    - [Terraform Security Analysis - Jumphost Prod](docs/terraform-security-analysis-jumphost-prod.md)
    - [Terraform Security Analysis - EKS Staging](docs/terraform-security-analysis-eks-staging.md)
    - [Terraform Security Analysis - EKS Prod](docs/terraform-security-analysis-eks-prod.md)
    - [Terraform Infra Costing - Core Staging](docs/terraform-infracost-core-staging.md)
    - [Terraform Infra Costing - Core Prod](docs/terraform-infracost-core-prod.md)
    - [Terraform Infra Costing - Jumphost Staging](docs/terraform-infracost-jumphost-staging.md)
    - [Terraform Infra Costing - Jumphost Prod](docs/terraform-infracost-jumphost-prod.md)
    - [Terraform Infra Costing - EKS Staging](docs/terraform-infracost-eks-staging.md)
    - [Terraform Infra Costing - EKS Prod](docs/terraform-infracost-eks-prod.md)

- Terraform State Inventory
  - [Core Infrastructure Staging](docs/core-infra-staging.md)
  - [Core Infrastructure Prod](docs/core-infra-prod.md)
  - [EKS Staging](docs/eks-staging.md)
  - [EKS Production](docs/eks-prod.md)
  - [Jumphost Staging](docs/jumphost-staging.md)
  - [Jumphost Production](docs/jumphost-prod.md)

- Reproduce DEMO, detail [here](docs/DEMO.md)

---
## Version 3.2

### Features

- All features from version 3.1
- Change references path Dockerfile with spesific tag version
  - Alpine: `devopscorner/cicd:alpine-nginx-1.23`
  - Ubuntu: `devopscorner/cicd:ubuntu-nginx-1.23`
  - CodeBuild: `devopscorner/cicd:codebuild-4.0`

---
## Version 3.1

### Features

- All features from version 3.0
- Added Multi Static Code Analysis for Terraform, inside pipeline `terraform plan`
  - Tenable [`terrascan`](https://github.com/tenable/terrascan)
  - Aqua [`tfsec`](https://github.com/aquasecurity/tfsec)

  ```
  # ========================= #
  #  Terraform Plan (Review)  #
  # ========================= #
  - terraform init
  - terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
  - terraform plan --out tfplan.binary
  - terraform show -json tfplan.binary > tfplan.json

  # ================== #
  #  Terraform Addons  #
  # ================== #
  # ~ Terrascan ~
  - terrascan init
  - terrascan scan -o human
  # ~ Tfsec ~
  - tfsec .
  # ~ Checkov
  - checkov -f tfplan.json
  # ~ Infracost
  - infracost breakdown --path tfplan.json
  ```

---
## Version 3.0

### Features

- Added Terraform Container with CodeBuild Distribution (AWS Linux) version 4.0
- Refactoring Buildspec for Building Image `devopscorner/terraform-infra` for Alpine, Ubuntu & CodeBuild Container
- Refactoring Buildspec for `terraform plan`, `terraform apply` & `terraform destroy`
- Added GitHub Action Workflow for Core, Resources & TFState
- Added Terraform addons inside pipeline `terraform plan`:
  - Static Code Analysis for Terraform
    - Tenable [`terrascan`](https://github.com/tenable/terrascan)
  - Terraform Plan Scanning with [`checkov`](https://github.com/bridgecrewio/checkov)
  - Terraform Version Manager with [`tfenv`](https://github.com/tfutils/tfenv)
  - Cloud Cost Estimate with [`infracost`](https://www.infracost.io/)

  ```
  # ========================= #
  #  Terraform Plan (Review)  #
  # ========================= #
  - terraform init
  - terraform workspace select ${WORKSPACE_ENV} || terraform workspace new ${WORKSPACE_ENV}
  - terraform plan --out tfplan.binary
  - terraform show -json tfplan.binary > tfplan.json

  # ================== #
  #  Terraform Addons  #
  # ================== #
  # ~ Terrascan ~
  - terrascan init
  - terrascan scan -o human
  # ~ Checkov
  - checkov -f tfplan.json
  # ~ Infracost
  - infracost breakdown --path tfplan.json
  ```

---
## Version 2.0

### Features

- Upgrade EKS Cluster version to 1.22 from 1.19
- Added Schedule Autoscale Node Group for Optimization (Staging/Develop Environment)
- Added Monitoring Datadog Installation. See `Datadog` installation readme [here](tools/datadog-monitoring/README.md)
- Added GitHub Action Workflow for [Infracost EKS](.github/workflows/infracost-eks.yml) (trigger by Pull Request / PR). See `Infracost` readme [here](tools/infracost/README.md).
- Added Kubecost for Monitoring Costing EKS Cluster, securing with basic-auth access. See `Kubecost` readme [here](tools/kubecost/README.md).
- Added Jumppods (Jump Host Pods) for maintenance EKS inside pods (`curl`, `wget`, `telnet`, `ping`, etc), securing with basic-auth access

---
## Version 1.1

### Features

- Update IAM policy for DEV & UAT environment
- Update subnet ip range from /24 (256 ips) to /20 (4096 ips)
- Update latest manifest installation
  - Ingress Nginx ver-1.1.2
  - Ingress ALB ver-2.4.1
- Added python scripts as new feature inspect & patch (update) tags of each autoscale EKS nodes

---
## Version 1.0

### Features

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
