#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

helm get all adot-collector-kubeprometheus -n adot-collector-kubeprometheus > helm/helm_get_adot-collector-kubeprometheus.yaml
helm get all kube-state-metrics -n kube-system > helm/helm_get_kube-state-metrics.yaml
helm get all prometheus-node-exporter -n prometheus-node-exporter > helm/helm_get_prometheus-node-exporter.yaml
helm get all cert-manager -n cert-manager > helm/helm_get_cert-manager.yaml
helm get all cert-manager-ca -n cert-manager > helm/helm_get_cert-manager-ca.yaml
helm get all cert-manager-letsencrypt -n cert-manager > helm/helm_get_cert-manager-letsencrypt.yaml