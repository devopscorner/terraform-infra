## Redis Helm

### Installation

```
helm install redis-dev bitnami/redis -n devopscorner-dev --set nodeSelector."node"=sharedredis-dev
helm install redis-uat bitnami/redis -n devopscorner-uat --set nodeSelector."node"=sharedredis-uat
```

### Update Helm Release Configuration

- Using Lens
- Update release helm name `redis-dev` with file `10-redis-cluster-dev`
- Update release helm name `redis-uat` with file `10-redis-cluster-uat`

### Helm Installation Results

```
NAME: redis-dev
LAST DEPLOYED: Mon Mar 14 17:27:45 2022
NAMESPACE: devopscorner-dev
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: redis
CHART VERSION: 16.5.2
APP VERSION: 6.2.6

** Please be patient while the chart is being deployed **

Redis&trade; can be accessed on the following DNS names from within your cluster:

    redis-dev-master.devopscorner-dev.svc.cluster.local for read/write operations (port 6379)
    redis-dev-replicas.devopscorner-dev.svc.cluster.local for read-only operations (port 6379)



To get your password run:

    export REDIS_PASSWORD=$(kubectl get secret --namespace devopscorner-dev redis-dev -o jsonpath="{.data.redis-password}" | base64 --decode)

To connect to your Redis&trade; server:

1. Run a Redis&trade; pod that you can use as a client:

   kubectl run --namespace devopscorner-dev redis-client --restart='Never'  --env REDIS_PASSWORD=$REDIS_PASSWORD  --image docker.io/bitnami/redis:6.2.6-debian-10-r146 --command -- sleep infinity

   Use the following command to attach to the pod:

   kubectl exec --tty -i redis-client \
   --namespace devopscorner-dev -- bash

2. Connect using the Redis&trade; CLI:
   REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-dev-master
   REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-dev-replicas

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace devopscorner-dev svc/redis-dev-master : &
    REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h 127.0.0.1 -p
```