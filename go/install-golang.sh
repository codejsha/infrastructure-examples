#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

VERSION="1.18"
OS="linux"
ARCH="amd64"

curl -LJO https://golang.org/dl/go${VERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf go${VERSION}.${OS}-${ARCH}.tar.gz
rm -f go${VERSION}.${OS}-${ARCH}.tar.gz

### env
# export GOROOT="/usr/local/go"
# export GOPATH="${HOME}/go"
# export PATH="${PATH}:/usr/local/go/bin"
