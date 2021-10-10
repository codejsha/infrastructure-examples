#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="sample-domain1-ns"
DOMAIN_NAME="sample-domain1"

kubectl create configmap override-domain-config --namespace ${NAMESPACE} --from-file ./override-domain-config
kubectl label configmap override-domain-config --namespace ${NAMESPACE} weblogic.domainUID=${DOMAIN_NAME}
