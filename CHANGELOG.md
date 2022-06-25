# Terraform Infra - v2.0

Production Grade Terraform for Provisioning Infrastructure

## Features

- Upgrade EKS Cluster version to 1.22 from 1.19
- Added Schedule Autoscale Node Group for Optimization (Staging/Develop Environment)
- Added Monitoring Datadog Installation. See `Datadog` installation readme [here](tools/datadog-monitoring/README.md)
- Added GitHub Action Workflow for [Infracost EKS](.github/workflows/infracost-eks.yml) (trigger by Pull Request / PR). See `Infracost` readme [here](tools/infracost/README.md).
- Added Kubecost for Monitoring Costing EKS Cluster, securing with basic-auth access. See `Kubecost` readme [here](tools/kubecost/README.md).
- Added Jumppods (Jump Host Pods) for maintenance EKS inside pods (`curl`, `wget`, `telnet`, `ping`, etc), securing with basic-auth access

<hr>

# Terraform Infra - v1.1

Production Grade Terraform for Provisioning Infrastructure

## Features

- Update IAM policy for DEV & UAT environment
- Update subnet ip range from /24 (256 ips) to /20 (4096 ips)
- Update latest manifest installation
  - Ingress Nginx ver-1.1.2
  - Ingress ALB ver-2.4.1
- Added python scripts as new feature inspect & patch (update) tags of each autoscale EKS nodes

<hr>

# Terraform Infra - v1.0

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
