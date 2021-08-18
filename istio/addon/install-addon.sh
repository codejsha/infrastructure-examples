#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

ISTIO_VERSION="1.11.0"
PARENT_ISTIO_DIR="${HOME}"
ISTIO_DIR="${PARENT_ISTIO_DIR}/istio-${ISTIO_VERSION}"

cd ${ISTIO_DIR}
kubectl apply --namespace istio-system --filename samples/addons

### delete
# cd ${ISTIO_DIR}
# kubectl delete --filename samples/addons
