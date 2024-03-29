#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add jetstack https://charts.jetstack.io
# helm repo update

NAMESPACE="cert-manager"

helm upgrade --install my-cert-manager \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --set installCRDs="true" \
    jetstack/cert-manager
