#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add gitea-charts https://dl.gitea.io/charts
# helm repo update

NAMESPACE="gitea"

# helm install my-gitea \
helm upgrade --install my-gitea \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 4.1.0 \
    gitea-charts/gitea
