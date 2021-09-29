#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl apply --namespace elastic --filename https://download.elastic.co/downloads/eck/1.4.0/all-in-one.yaml

# kubectl logs --namespace elastic --follow statefulset.apps/elastic-operator
# kubectl logs -n elastic -f statefulset.apps/elastic-operator

### delete
# kubectl delete --filename https://download.elastic.co/downloads/eck/1.4.0/all-in-one.yaml
