#!/usr/bin/bash

NAMESPACE="minio-system"
kubectl create namespace ${NAMESPACE}

helm install my-minio \
    --namespace ${NAMESPACE} \
    --set accessKey="admin" \
    --set secretKey="changeit" \
    --set service.type="LoadBalancer" \
    --set ingress.enabled="true" \
    --set ingress.labels."node-role\.kubernetes\.io/ingress"="platform" \
    --set ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set ingress.hosts={"minio.kube.example.com"} \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --set persistence.accessMode="ReadWriteOnce" \
    --version 5.0.30 \
    stable/minio
