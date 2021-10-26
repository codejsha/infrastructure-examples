#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

curl -L https://istio.io/downloadIstio | sh -

# ISTIO_VERSION="1.11.4"
# curl -L https://istio.io/downloadIstio | ISTIO_VERSION="${ISTIO_VERSION}" TARGET_ARCH="x86_64" sh -

cd istio-*
cd bin
chmod +x istioctl
sudo mv istioctl /usr/local/bin
