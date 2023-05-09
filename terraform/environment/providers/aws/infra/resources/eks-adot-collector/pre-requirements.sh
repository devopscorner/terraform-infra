#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

helm repo add aws-otel-collector https://aws-observability.github.io/aws-otel-helm-charts
helm repo update

helm search repo aws-otel-collector

# NAME                                           	CHART VERSION	APP VERSION	DESCRIPTION
# aws-otel-collector/adot-exporter-for-eks-on-ec2	0.14.0       	0.28.0     	A Helm chart for collecting metrics using ADOT ...

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}
kubectl create namespace observability

helm upgrade --install adot-collector aws-otel-collector/adot-exporter-for-eks-on-ec2 -n observability --set server.nodeSelector."node"="devopscorner-monitoring"