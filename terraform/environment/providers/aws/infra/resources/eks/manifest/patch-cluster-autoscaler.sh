#!/bin/bash

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"
export SSL_CERT_ARN="arn:aws:acm:ap-southeast-1:${ACCOUNT_ID}:certificate/HASH_NUMBER"

kubectl annotate serviceaccount cluster-autoscaler -n kube-system eks.amazonaws.com/role-arn=arn:aws:iam::${ACCOUNT_ID}:role/cluster-autoscaler-${EKS_CLUSTER}-role --overwrite

kubectl -f patch-cluster-autoscaler.yaml apply