#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

kubectl create namespace sample-weblogic-operator-ns
kubectl create serviceaccount --namespace sample-weblogic-operator-ns sample-weblogic-operator-sa
