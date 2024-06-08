#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

### download webhook
curl -s -LJO https://github.com/adnanh/webhook/releases/latest/download/webhook-linux-amd64.tar.gz
tar -xzf webhook-linux-amd64.tar.gz
mkdir -p apps
mv webhook-linux-amd64/webhook apps/
rm -r webhook-linux-amd64

### docker build
docker build -f Dockerfile -t webhook:latest .
