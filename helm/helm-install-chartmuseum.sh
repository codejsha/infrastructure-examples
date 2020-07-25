#!/usr/bin/bash

NAMESPACE="chart-system"
kubectl create namespace ${NAMESPACE}

helm install my-chartmuseum \
    --namespace ${NAMESPACE} \
    --set env.open.DISABLE_API="false" \
    --set ingress.enabled="true" \
    --set ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set ingress.hosts[0].name="chartmuseum.kube.example.com" \
    --set ingress.hosts[0].path="/" \
    --set ingress.hosts[0].tls="false" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --version 2.13.1 \
    -f custom.yaml \
    stable/chartmuseum

### health check
# curl --insecure --verbose http://chartmuseum.kube.example.com/health
