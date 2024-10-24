#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

COREDNS_HOME="${HOME}/repos/infrastructure-examples/coredns"

######################################################################

function start_coredns() {
    sudo /usr/local/bin/coredns \
        -conf ${COREDNS_HOME}/corefile-server.conf \
        -pidfile ${COREDNS_HOME}/coredns.pid
}

function start_coredns_nohup() {
    sudo nohup /usr/local/bin/coredns \
        -conf ${COREDNS_HOME}/corefile-server.conf \
        -pidfile ${COREDNS_HOME}/coredns.pid \
        > ${COREDNS_HOME}/nohup.coredns.out 2>&1 &
    sleep 1
    sudo chown $(id -un):$(id -gn) ${COREDNS_HOME}/coredns.pid
}

######################################################################

# start_coredns
start_coredns_nohup
