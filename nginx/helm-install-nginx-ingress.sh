#!/usr/bin/bash

NAMESPACE="ingress-nginx"
kubectl create namespace ${NAMESPACE}

helm install my-ingress \
    --namespace ${NAMESPACE} \
    --version 1.41.2 \
    stable/nginx-ingress
