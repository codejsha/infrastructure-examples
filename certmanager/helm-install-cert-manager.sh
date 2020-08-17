#!/usr/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo update

NAMESPACE="cert-manager"
kubectl create namespace ${NAMESPACE}

# helm install cert-manager \
helm upgrade --install cert-manager \
    --namespace ${NAMESPACE} \
    --namespace cert-manager \
    --set installCRDs=true \
    --version v0.15.1 \
    jetstack/cert-manager
