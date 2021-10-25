#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update

NAMESPACE="prometheus"

# helm install my-prometheus-stack \
helm upgrade --install my-prometheus-stack \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-stack.yaml \
    --version 19.2.2 \
    prometheus-community/kube-prometheus-stack
