#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### install
kustomize build . | kubectl apply -f -

### uninstall
# kustomize build . | kubectl delete -f -
