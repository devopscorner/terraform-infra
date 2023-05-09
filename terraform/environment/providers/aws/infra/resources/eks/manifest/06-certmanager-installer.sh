#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"
export SSL_CERT_ARN="arn:aws:acm:ap-southeast-1:${ACCOUNT_ID}:certificate/HASH_NUMBER"

kubectl config use-context arn:aws:eks:ap-southeast-1:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl create namespace cert-manager

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml

echo '' > cert-manager.custom.yaml

# helm template \
#   cert-manager jetstack/cert-manager \
#   --namespace cert-manager \
#   --create-namespace \
#   --version v1.11.0 \
#   # Example: disabling prometheus using a Helm parameter
#   # --set prometheus.enabled=false
#   # Uncomment to also template CRDs
#   --set installCRDs=true >> cert-manager.custom.yaml

helm template \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.11.0 \
  --set installCRDs=true >> cert-manager.custom.yaml

kubectl apply -f cert-manager.custom.yaml

kubectl apply -f 09-metrics-server.yaml

curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/kubectl-cert_manager-linux-amd64.tar.gz
tar xzf kubectl-cert-manager.tar.gz
sudo mv kubectl-cert_manager /usr/local/bin

sleep 3

kubectl cert-manager check api

kubectl -f certificate-issuer-staging.yaml apply
kubectl -f certificate-issuer-prod.yaml apply