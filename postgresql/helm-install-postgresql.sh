#!/usr/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

PASSWORD="changeit"

NAMESPACE="postgres-system"
kubectl create namespace ${NAMESPACE}

# helm install my-postgres \
helm upgrade --install my-postgres \
    --namespace ${NAMESPACE} \
    --set postgresqlUsername="postgres" \
    --set postgresqlPassword="${PASSWORD}" \
    --set service.type="LoadBalancer" \
    --set service.loadBalancerIP="10.10.10.99" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --values gitlab-override.yaml \
    --version 9.4.1 \
    bitnami/postgresql
