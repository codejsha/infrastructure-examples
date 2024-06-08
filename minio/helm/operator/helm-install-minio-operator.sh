#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add minio https://operator.min.io/
# helm repo update

NAMESPACE="minio-operator"

helm upgrade --install my-minio-operator \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values operator-values.yaml \
    --version 4.5.8 \
    minio/operator
