#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

cat <<EOF > configuration-values-003-03.json
{
  "collector": {
    "serviceAccount": {
      "create": false,
      "name": "adot-collector-sa"
    },
    "amp": {
      "enabled": true,
      "remoteWriteEndpoint": "https://aps-workspaces.ap-southeast-1.amazonaws.com/workspaces/ws-xxx/api/v1/remote_write"
    }
  }
}
EOF

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER} \
    --region ${AWS_REGION} \
    --addon-name adot \
    --addon-version v0.70.0-eksbuild.1 \
    --configuration-values file://configuration-values-003-03.json
