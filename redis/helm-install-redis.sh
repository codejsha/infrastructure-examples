#!/usr/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

PASSWORD="changeit"

NAMESPACE="redis-system"
kubectl create namespace ${NAMESPACE}

helm install my-redis \
    --namespace ${NAMESPACE} \
    --set password="${PASSWORD}" \
    --set master.persistence.storageClass="rook-ceph-block" \
    --set slave.persistence.storageClass="rook-ceph-block" \
    --set ingress.enabled="true" \
    --set ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set ingress.name={"redis.kube.example.com"} \
    --set ingress.path="/" \
    --version 10.7.1 \
    bitnami/redis
