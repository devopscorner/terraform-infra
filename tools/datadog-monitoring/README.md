# Datadog Installation & Update Helm

## PREPARATION

### Install Helm Plugins
```
helm plugin install https://github.com/databus23/helm-diff
helm plugin install https://github.com/hypnoglow/helm-s3.git
```

### Add Helm Repositories
```
helm repo add stable https://charts.helm.sh/stable
helm repo add datadog-crds https://helm.datadoghq.com
helm repo add datadog https://helm.datadoghq.com
```

### Update Helm Repositories
```
helm repo update
```

### List Helm Repositories
```
helm repo list
---
NAME         URL
stable       https://charts.helm.sh/stable
datadog-crds https://helm.datadoghq.com
datadog      https://helm.datadoghq.com
```

> If you want to remove helm repository
> ```
> helm repo remove [name_repo]
> helm repo remove stable
> helm repo update
> ```

### Get Kubectl Context (Config Environment)

```
kubectl get context
---
arn:aws:eks:ap-southeast-1:YOUR_AWS_ACCOUNT:cluster/CLUSTER_NAME
```

### Get Kubectl Context with kubectx
```
kubectx
---
arn:aws:eks:ap-southeast-1:YOUR_AWS_ACCOUNT:cluster/CLUSTER_NAME
```

## NON PRODUCTION (DEV, UAT, RND, QA)

### Change Kube Context
```
kubectl config use-context arn:aws:eks:ap-southeast1:YOUR_AWS_ACCOUNT:cluster/CLUSTER_NAME
--- or ---
kubectx arn:aws:eks:ap-southeast1:YOUR_AWS_ACCOUNT:cluster/CLUSTER_NAME
```

### Install Datadog Helm Chart

- Install Helm v2.x
  ```
  helm install --name datadog-monitoring --namespace=devopscorner-datadog \
      --set datadog.apiKey=DATADOG_API_STAGING \
      --set datadog.appKey=DATADOG_APP_STAGING \
      datadog/datadog
  ```

- Install Helm v3.x
  ```
  helm install datadog-monitoring --namespace=devopscorner-datadog \
      --set datadog.apiKey=DATADOG_API_STAGING \
      --set datadog.appKey=DATADOG_APP_STAGING \
      datadog/datadog

> **NOTES:**
> DATADOG_APP_STAGING is move to Team Page. So you need to have Admin permission for using this key.

## Export Manifest Helm Chart
```
helm get manifest datadog-monitoring -n devopscorner-datadog > ~/Desktop/datadog-monitoring-staging-manifest.yml
```

## Udate Datadog Helm Chart Value

- Download helm-values datadog, save to Desktop [datadog-staging-values.yml](https://raw.githubusercontent.com/DataDog/helm-charts/main/charts/datadog/values.yaml)

- Edit Tags for specific environment & cluster
  ```
  tags:
    - "environment:staging"
    - "cluster:CLUSTER_NAME"
  ```

- Enable logs (for Production)
  ```
  logs:
    enabled: true
    containerCollectAll: true
    containerCollectUsingFiles: true
  ```

- Additional configuration (High Availability)
  ```
  site: us1.datadoghq.com
  replicas: 2
  createPodDisruptionBudget: true
  ```

## Update Helm v2.x
```
helm upgrade --values ~/Desktop/datadog-staging-values.yml datadog-monitoring datadog/datadog -n devopscorner-datadog --recreate-pods
```

## Update Helm v3.x
```
helm upgrade --values ~/Desktop/datadog-staging-values.yml datadog-monitoring datadog/datadog -n devopscorner-datadog
```
