#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo update

NAMESPACE="prometheus-system"

# helm install my-prometheus \
helm upgrade --install my-prometheus \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-stack.yaml \
    --version 18.0.10 \
    prometheus-community/kube-prometheus-stack
