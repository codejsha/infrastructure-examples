#!/usr/bin/bash

NAMESPACE="ingress-nginx"
kubectl create namespace ${NAMESPACE}

helm install my-ingress \
    --namespace ${NAMESPACE} \
    --version 1.40.2 \
    stable/nginx-ingress
