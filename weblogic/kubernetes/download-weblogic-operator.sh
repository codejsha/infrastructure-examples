#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

if [ ! -d "weblogic-kubernetes-operator" ]; then
    git clone --depth 1 --branch v3.3.2 https://github.com/oracle/weblogic-kubernetes-operator
fi
