#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"
export SSL_CERT_ARN="arn:aws:acm:ap-southeast-1:${ACCOUNT_ID}:certificate/CERT_ID"

# Use Template Replace String
cat 01-auth-template.yaml | envsubst > 01-auth.yaml
cat 07-ingress-alb-controller-v2.4.1-template.yaml | envsubst > 07-ingress-alb.yaml
cat 07-ingress-nginx-v1.1.2-template.yaml | envsubst > 07-ingress-nginx.yaml

kubectl config use-context arn:aws:eks:ap-southeast-1:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

kubectl -f 01-auth.yaml apply
kubectl -f 02-serviceaccount.yaml apply
kubectl -f 03-role.yaml apply
kubectl -f 04-rolebinding.yaml apply
kubectl -f 05-secret.yaml apply

# kubectl --validate=false -f 06-certmanager-v1.8.0.yaml apply
./06-certmanager-installer.sh

kubectl -f 07-ingress-alb.yaml apply
kubectl -f 07-ingress-nginx.yaml apply
kubectl -f 08-devops-user-rbac.yaml apply
kubectl -f 09-metrics-server.yaml apply

./992-autoscaler-staging.sh