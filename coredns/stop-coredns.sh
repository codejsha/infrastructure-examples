#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

COREDNS_HOME="${HOME}/repos/infrastructure-examples/coredns"

######################################################################

function stop_coredns() {
    sudo pkill --echo --count --pidfile ${COREDNS_HOME}/coredns.pid
    # sudo kill -9 $(cat ${COREDNS_HOME}/coredns.pid)
}

######################################################################

stop_coredns
