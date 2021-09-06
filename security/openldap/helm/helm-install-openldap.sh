#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# helm repo add stable https://charts.helm.sh/stable
# helm repo update

NAMESPACE="ldap-system"

# helm install my-openldap \
helm upgrade --install my-openldap \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values.yaml \
    stable/openldap
