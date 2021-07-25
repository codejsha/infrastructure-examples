#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

helm repo add appscode https://charts.appscode.com/stable
helm repo update

NAMESPACE="kube-system"

# helm install my-kubed \
helm upgrade --install my-kubed \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --version v0.12.0 \
    appscode/kubed
