#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add jetstack https://charts.jetstack.io
# helm repo update

NAMESPACE="cert-manager"
kubectl create namespace ${NAMESPACE}
kubectl label namespace ${NAMESPACE} istio-injection=enabled

helm upgrade --install my-cert-manager \
    --namespace ${NAMESPACE} \
    --set installCRDs="true" \
    jetstack/cert-manager
