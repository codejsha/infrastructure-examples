#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add cetic https://cetic.github.io/helm-charts
# helm repo update

NAMESPACE="ldap"

# helm install my-ldapadmin \
helm upgrade --install my-ldapadmin \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    cetic/phpldapadmin
