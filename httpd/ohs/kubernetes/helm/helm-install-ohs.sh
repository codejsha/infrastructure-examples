#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="ohs"

# helm install my-ohs \
helm upgrade --install my-ohs \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    --values values-openshift.yaml \
    ./ohs-helm
