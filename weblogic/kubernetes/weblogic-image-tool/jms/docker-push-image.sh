#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

docker image tag weblogic:14.1.1-jms harbor.example.com/weblogic:14.1.1-jms
docker image push harbor.example.com/weblogic:14.1.1-jms
