#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./add-user.sh --instance=inst1 --port-offset=0
bash ./add-user.sh --instance=inst2 --port-offset=1
