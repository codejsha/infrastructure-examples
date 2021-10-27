#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### username: elastic

### get password
kubectl get secret --namespace elastic elasticstack-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
