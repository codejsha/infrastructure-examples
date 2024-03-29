#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

bash ./set-record-request-start-time.sh --port-offset=0
bash ./set-record-request-start-time.sh --port-offset=1

bash ./add-access-log.sh --port-offset=0
bash ./add-access-log.sh --port-offset=1

bash ./set-logging.sh --port-offset=0
bash ./set-logging.sh --port-offset=1
