#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="elastic"

# helm install my-fluentd \
helm upgrade --install my-fluentd \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --version 4.3.1 \
    bitnami/fluentd
