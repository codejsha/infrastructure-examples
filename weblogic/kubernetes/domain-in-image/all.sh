#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./create-domain-namespace.sh
bash ./create-domain-credentials.sh

# bash ./helm-upgrade-trafik.sh
# bash ./helm-install-domain-ingress.sh
