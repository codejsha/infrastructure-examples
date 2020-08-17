#!/usr/bin/bash

helm repo add influxdata https://helm.influxdata.com
helm repo update

NAMESPACE="influx-system"
kubectl create namespace ${NAMESPACE}

# helm install my-influxdb \
helm upgrade --install my-influxdb \
    --namespace ${NAMESPACE} \
    --set adminUser.user="admin" \
    --set adminUser.password="changeit" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    influxdata/influxdb2
