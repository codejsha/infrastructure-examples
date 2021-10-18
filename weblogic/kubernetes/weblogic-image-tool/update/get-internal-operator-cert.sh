#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

OPERATOR_NAMESPACE="sample-weblogic-operator-ns"

kubectl describe configmap weblogic-operator-cm -n ${OPERATOR_NAMESPACE}
