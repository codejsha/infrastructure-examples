#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

curl -LJO https://github.com/minio/kes/releases/latest/download/kes-linux-amd64
chmod +x kes-linux-amd64
sudo mv kes-linux-amd64 /usr/local/bin/kes
