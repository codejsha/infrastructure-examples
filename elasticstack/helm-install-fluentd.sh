#!/usr/bin/bash

NAMESPACE="elastic-system"
kubectl create namespace ${NAMESPACE}

helm install my-fluentd \
    --namespace ${NAMESPACE} \
    --set output.host="elasticsearch-master" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --version 2.4.2 \
    stable/fluentd
