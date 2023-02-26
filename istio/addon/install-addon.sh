#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

cd ../istio-*/
kubectl apply --namespace istio-system --filename samples/addons

### delete
# cd ../istio-*/
# kubectl delete --filename samples/addons
