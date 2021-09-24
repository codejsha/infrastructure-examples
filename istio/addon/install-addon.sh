#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

cd ..

curl -L https://istio.io/downloadIstio | sh -

# ISTIO_VERSION="1.11.0"
# curl -L https://istio.io/downloadIstio | ISTIO_VERSION="${ISTIO_VERSION}" TARGET_ARCH="x86_64" sh -

cd istio-*
kubectl apply --namespace istio-system --filename samples/addons

### delete
# cd ../istio-*
# kubectl delete --filename samples/addons
