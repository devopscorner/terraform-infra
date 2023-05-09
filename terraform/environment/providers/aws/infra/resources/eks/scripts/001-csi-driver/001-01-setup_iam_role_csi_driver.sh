#!/bin/sh

AWS_REGION=ap-southeast-1
AWS_ACCOUNT_ID=YOUR_AWS_ACCOUNT
EKS_CLUSTER=devopscorner-prod

aws eks describe-cluster \
  --name ${EKS_CLUSTER} \
  --region ${AWS_REGION} \
  --query "cluster.identity.oidc.issuer" \
  --output text

# https://oidc.eks.ap-southeast-1.amazonaws.com/id/OIDC_ID

cat <<EOF > aws-ebs-csi-driver-trust-policy.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${AWS_ACCOUNT_ID}:oidc-provider/oidc.eks.ap-southeast-1.amazonaws.com/id/OIDC_ID"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.ap-southeast-1.amazonaws.com/id/OIDC_ID:aud": "sts.amazonaws.com",
          "oidc.eks.ap-southeast-1.amazonaws.com/id/OIDC_ID:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }
  ]
}
EOF

aws iam create-role \
  --role-name AmazonEKS_EBS_CSI_DriverRole \
  --assume-role-policy-document file://"aws-ebs-csi-driver-trust-policy.json"

aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --role-name AmazonEKS_EBS_CSI_DriverRole

cat <<EOF > kms-key-for-encryption-on-ebs.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ],
      "Resource": ["arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/HASH_ID"],
      "Condition": {
        "Bool": {
          "kms:GrantIsForAWSResource": "true"
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": ["arn:aws:kms:ap-southeast-1:YOUR_AWS_ACCOUNT:key/HASH_ID"]
    }
  ]
}
EOF

aws iam create-policy \
  --policy-name KMS_Key_For_Encryption_On_EBS_Policy \
  --policy-document file://kms-key-for-encryption-on-ebs.json

aws iam attach-role-policy \
  --policy-arn "arn:aws:iam::${AWS_ACCOUNT_ID}:policy/KMS_Key_For_Encryption_On_EBS_Policy" \
  --role-name AmazonEKS_EBS_CSI_DriverRole

kubectl annotate serviceaccount ebs-csi-controller-sa \
    -n kube-system \
    eks.amazonaws.com/role-arn=arn:aws:iam::${AWS_ACCOUNT_ID}:role/AmazonEKS_EBS_CSI_DriverRole

kubectl rollout restart deployment ebs-csi-controller -n kube-system
