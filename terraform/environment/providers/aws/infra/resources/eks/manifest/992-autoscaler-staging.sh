#!/bin/sh

kubectl config use-context arn:aws:eks:ap-southeast-1:YOUR_AWS_ACCOUNT:cluster/devopscorner-staging

kubectl apply -f  https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

kubectl -n kube-system patch deployment cluster-autoscaler --patch \
      '{"spec": { "template": { "metadata":{"annotations":{"cluster-autoscaler.kubernetes.io/safe-to-evict": "false"}}, "spec": { "containers": [{ "image": "k8s.gcr.io/autoscaling/cluster-autoscaler:v1.19.0", "name": "cluster-autoscaler", "resources": { "requests": {"cpu": "100m", "memory": "300Mi"}}, "command": [ "./cluster-autoscaler", "--v=4", "--stderrthreshold=info", "--cloud-provider=aws", "--skip-nodes-with-local-storage=false", "--expander=least-waste", "--node-group-auto-discovery=asg:tag=k8s.io/cluster-autoscaler/enabled,k8s.io/cluster-autoscaler/devopscorner-staging", "--balance-similar-node-groups", "--skip-nodes-with-system-pods=false" ]}]}}}}'

kubectl patch ServiceAccount cluster-autoscaler -n kube-system --patch '{"metadata":{"annotations":{"eks.amazonaws.com/role-arn": "arn:aws:iam::YOUR_AWS_ACCOUNT:role/cluster-autoscaler-devopscorner-staging-role"}}}'

kubectl apply -f 09-metrics-server.yaml