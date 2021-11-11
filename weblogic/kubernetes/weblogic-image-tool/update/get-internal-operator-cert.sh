#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

OPERATOR_NAMESPACE="sample-weblogic-operator-ns"

kubectl get configmap weblogic-operator-cm --namespace ${OPERATOR_NAMESPACE} --output json | jq -r ".data.internalOperatorCert"
