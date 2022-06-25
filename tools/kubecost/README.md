# Kubecost

## Install Kubecost
### Configuration
- Detail References: [here](https://www.kubecost.com/install)
- Register your email to get `kubecostToken`
  ```
  https://www.kubecost.com/install
  ```
- With helm3
  ```
  kubectl create namespace kubecost

  helm repo add kubecost https://kubecost.github.io/cost-analyzer

  helm install kubecost kubecost/cost-analyzer --namespace kubecost --set kubecostToken=KUBECOST_TOKEN
  ```

### Enable Port Forward
```
kubectl port-forward --namespace kubecost deployment/kubecost-cost-analyzer 9090
```

### Access Kubecost in Browser
```
http://localhost:9090
```

### Access Grafana in Browser

```
http://localhost:9090/grafana
---
### Default Credentials (base64) ###
# admin-user: "YWRtaW4="
# admin-password: "c3Ryb25ncGFzc3dvcmQ="

username: admin
password: strongpassword
```

### Export Manifest
```
helm get manifest kubecost -n kubecost > ~/Desktop/kubecost-poc-manifest.yml
```

### Upgrade Helm
- Using helm
  ```
  helm upgrade --values ~/Desktop/kubecost-poc-manifest-modified.yml kubecost kubecost/cost-analyzer -n kubecost
  ```
- Using manifest
  ```
  kubectl -f ~/Desktop/kubecost-poc-manifest.yml apply -n kubecost
  ```

## Updating Kubecost

- With helm2
  ```
  helm repo update && helm upgrade kubecost kubecost/cost-analyzer
  ```

- With helm3

  ```
  helm repo update && helm upgrade kubecost kubecost/cost-analyzer -n kubecost
  ```

## Deleting Kubecost

- With helm2

  ```
  helm del --purge kubecost
  ```

- With helm3

  ```
  helm uninstall kubecost -n kubecost
  ```
