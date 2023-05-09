#!/bin/sh

export AWS_REGION="ap-southeast-1"
export ACCOUNT_ID="YOUR_AWS_ACCOUNT"
export EKS_CLUSTER="devopscorner-prod"
export EKS_VPC_ID="vpc-0987612345"

cat <<EOF > adot-collector-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: adot-collector
  namespace: observability
spec:
  type: NodePort
  selector:
    app: adot-collector-daemonset
  ports:
    - name: http
      port: 8888
      targetPort: 8888
EOF

cat <<EOF > ingress-nginx-adot-collector.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: adot-collector
  namespace: observability
  annotations:
    ingress.kubernetes.io/whitelist-source-range: 32.0.0.0/32
    meta.helm.sh/release-name: adot-collector
    meta.helm.sh/release-namespace: observability
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/affinity: cookie
    nginx.ingress.kubernetes.io/cors-allow-headers: '*'
    nginx.ingress.kubernetes.io/cors-allow-methods: '*'
    nginx.ingress.kubernetes.io/cors-allow-origin: '*'
    nginx.ingress.kubernetes.io/enable-cors: 'true'
    nginx.ingress.kubernetes.io/from-to-www-redirect: 'true'
spec:
  rules:
    - host: adot-collector.observability.svc.cluster.local
      http:
        paths:
          - path: /
            pathType: Prefix   # Prefix -or - ImplementationSpecific
            backend:
              service:
                name: adot-collector
                port:
                  number: 8888

  tls:
    - hosts:
      - adot-collector.observability.svc.cluster.local
EOF

kubectl config use-context arn:aws:eks:${AWS_REGION}:${ACCOUNT_ID}:cluster/${EKS_CLUSTER}
kubectl -f adot-collector-service.yaml apply
kubectl -f ingress-nginx-adot-collector.yaml apply