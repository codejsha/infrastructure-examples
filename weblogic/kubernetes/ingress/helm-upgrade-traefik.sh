#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="traefik"
DOMAIN_NAMESPACE="sample-domain1-ns"

helm upgrade traefik-operator \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --set "kubernetes.namespaces={${NAMESPACE},${DOMAIN_NAMESPACE}" \
    traefik/traefik
