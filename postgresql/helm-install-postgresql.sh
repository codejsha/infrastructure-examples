#!/usr/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

PASSWORD="changeit"

NAMESPACE="postgres-system"
kubectl create namespace ${NAMESPACE}

helm install my-postgres \
    --namespace ${NAMESPACE} \
    --set postgresqlUsername="postgres" \
    --set postgresqlPassword="${PASSWORD}" \
    --set service.type="LoadBalancer" \
    --set service.loadBalancerIP="10.10.10.99" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --set persistence.storageClass="rook-ceph-block" \
    --version 8.10.13 \
    bitnami/postgresql
