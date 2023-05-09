#!/bin/sh

AWS_REGION=ap-southeast-1
AWS_ACCOUNT_ID=YOUR_AWS_ACCOUNT
EKS_CLUSTER=devopscorner-prod

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --service-account-role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/AmazonEKS_EBS_CSI_DriverRole

aws eks describe-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --query "addon.addonVersion" \
    --output text

aws eks describe-addon-versions \
    --addon-name aws-ebs-csi-driver \
    --kubernetes-version 1.23 \
    --region ${AWS_REGION} \
    --query "addons[].addonVersions[].[addonVersion, compatibilities[].defaultVersion]" \
    --output text

aws eks update-addon \
    --cluster-name ${EKS_CLUSTER} \
    --addon-name aws-ebs-csi-driver \
    --region ${AWS_REGION} \
    --addon-version v1.17.0-eksbuild.1 \
    --resolve-conflicts PRESERVE
