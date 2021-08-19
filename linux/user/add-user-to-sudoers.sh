#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

USER="prouser"

cat <<EOF | sudo tee /etc/sudoers.d/${USER}
${USER} ALL=(ALL) NOPASSWD:ALL
EOF
