#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

kubectl apply -f https://amazon-eks.s3.amazonaws.com/docs/addons-otel-permissions.yaml

aws eks create-addon --addon-name adot --cluster-name ${EKS_CLUSTER}
aws eks list-clusters --region ${AWS_REGION}
aws eks describe-addon --addon-name adot --cluster-name ${EKS_CLUSTER}

eksctl create iamserviceaccount \
    --name adot-collector \
    --namespace observability \
    --cluster ${EKS_CLUSTER} \
    --attach-policy-arn arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess \
    --attach-policy-arn arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess \
    --attach-policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy \
    --approve \
    --override-existing-serviceaccounts

## Cleanup ###
eksctl delete iamserviceaccount \
    --name adot-collector \
    --namespace observability \
    --cluster ${EKS_CLUSTER}