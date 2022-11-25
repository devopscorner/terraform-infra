#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-staging"
export EKS_VPC_ID="vpc-1234567890"
export SSL_CERT_ARN="arn:aws:acm:ap-southeast-1:${ACCOUNT_ID}:certificate/HASH_NUMBER"

kubectl config use-context arn:aws:eks:ap-southeast-1:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}

kubectl apply -f  https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

kubectl -n kube-system patch deployment cluster-autoscaler --patch \
      '{"spec": { "template": { "metadata":{"annotations":{"cluster-autoscaler.kubernetes.io/safe-to-evict": "false"}}, "spec": { "containers": [{ "image": "k8s.gcr.io/autoscaling/cluster-autoscaler:v1.22.0", "name": "cluster-autoscaler", "resources": { "requests": {"cpu": "100m", "memory": "300Mi"}}, "command": [ "./cluster-autoscaler", "--v=4", "--stderrthreshold=info", "--cloud-provider=aws", "--skip-nodes-with-local-storage=false", "--expander=least-waste", "--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/${EKS_CLUSTER}", "--balance-similar-node-groups", "--skip-nodes-with-system-pods=false" ]}]}}}}'

kubectl patch ServiceAccount cluster-autoscaler -n kube-system --patch '{"metadata":{"annotations":{"eks.amazonaws.com/role-arn": "arn:aws:iam::${ACCOUNT_ID}:role/cluster-autoscaler-${EKS_CLUSTER}-role"}}}'

kubectl apply -f 09-metrics-server.yaml