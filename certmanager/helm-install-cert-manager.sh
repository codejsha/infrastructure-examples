#!/usr/bin/bash

helm repo add jetstack https://charts.jetstack.io
helm repo update

NAMESPACE="cert-manager"

# helm install cert-manager \
helm upgrade --install cert-manager \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --set installCRDs="true" \
    --version v1.0.1 \
    jetstack/cert-manager
