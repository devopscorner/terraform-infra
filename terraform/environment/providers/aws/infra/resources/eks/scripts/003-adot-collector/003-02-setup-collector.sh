#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER} \
    --region ${AWS_REGION} \
    --addon-name adot \
    --configuration-values "{\"manager\":{\"resources\":{\"limits\":{\"cpu\":\"200m\"}}}}" \
    --resolve-conflicts=OVERWRITE

cat <<EOF > configuration-values-003-02.json
{
  "manager": {
    "resource": {
      "limits": {
        "cpu": "200m"
      }
    }
  }
}
EOF

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER} \
    --region ${AWS_REGION} \
    --configuration-values file://configuration-values-003-02.json \
    --resolve-conflicts=OVERWRITE

aws eks describe-addon-configuration --addon-name adot --addon-version v0.70.0-eksbuild.1