#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

kubectl -f manifest-adot.yaml -n adot-collector-kubeprometheus apply

# kubectl -f manifest-adot-cwlogs.yaml -n adot-collector-kubeprometheus apply
# kubectl -f manifest-xray.yaml -n adot-collector-kubeprometheus apply
# kubectl -f manifest-adot-container-insights.yaml -n adot-collector-kubeprometheus apply

helm list -A --kube-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}
# helm upgrade adot-collector-kubeprometheus opentelemetry-0.2.0 -n adot-collector-kubeprometheus -f helm_get_all.yaml