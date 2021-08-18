#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

curl -L https://github.com/Praqma/helmsman/releases/download/v3.7.2/helmsman_3.7.2_linux_amd64.tar.gz | tar zx
chmod +x helmsman
sudo mv helmsman /usr/local/bin/helmsman
rm -f LICENSE README.md
