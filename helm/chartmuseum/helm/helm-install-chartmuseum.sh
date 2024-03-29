#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export AWS_ACCESS_KEY="minio"
export AWS_SECRET_KEY="minio123"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="chartmuseum"

# helm install my-chartmuseum \
helm upgrade --install my-chartmuseum \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-temp.yaml \
    --version 2.14.2 \
    stable/chartmuseum
