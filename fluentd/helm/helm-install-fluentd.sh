#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export ELASTICSEARCH_PASSWORD="$(kubectl get secret -n elastic elasticstack-es-elastic-user -o=json | jq -r .data.elastic | base64 -d)"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="elastic"

# helm install my-fluentd \
helm upgrade --install my-fluentd \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-temp.yaml \
    --version 4.3.1 \
    bitnami/fluentd
