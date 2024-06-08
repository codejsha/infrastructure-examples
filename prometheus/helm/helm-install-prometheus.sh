#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
# helm repo add kube-state-metrics https://kubernetes.github.io/kube-state-metrics
# helm repo update

NAMESPACE="monitoring"

helm upgrade --install my-prometheus \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 19.6.0 \
    prometheus-community/prometheus
