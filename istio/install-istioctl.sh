#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ISTIO_VERSION="1.11.0"
PARENT_ISTIO_DIR="${HOME}"
ISTIO_DIR="${PARENT_ISTIO_DIR}/istio-${ISTIO_VERSION}"

# curl -L https://istio.io/downloadIstio | sh -
curl -L https://istio.io/downloadIstio | ISTIO_VERSION="${ISTIO_VERSION}" TARGET_ARCH="x86_64" sh -

cd ${ISTIO_DIR}
cd bin
chmod +x istioctl
sudo mv istioctl /usr/local/bin
