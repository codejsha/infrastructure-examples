#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

if [ ! -d "weblogic-kubernetes-operator" ]; then
    curl -LJO https://github.com/oracle/weblogic-kubernetes-operator/archive/refs/tags/v3.3.2.tar.gz
    tar -xzf weblogic-kubernetes-operator-3.3.2.tar.gz
    mv weblogic-kubernetes-operator-3.3.2 weblogic-kubernetes-operator
fi
