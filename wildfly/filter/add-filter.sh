#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../env-base.sh

######################################################################

function add_filter() {
    ${JBOSS_HOME}/bin/jboss-cli.sh \
        --connect \
        --controller="${BIND_ADDRESS_MGMT}:${JBOSS_MGMT_HTTP_PORT}" \
        --user="${USERNAME}" \
        --password="${PASSWORD}" \
<<EOF
batch
/subsystem=undertow/configuration=filter/custom-filter=example-handler:add(class-name=com.example.ExampleHandler,module=com.example.undertow.handler)
/subsystem=undertow/server=default-server/host=default-host/filter-ref=example-handler:add()
run-batch
quit
EOF
}

######################################################################

add_filter
