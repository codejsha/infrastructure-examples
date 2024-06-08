#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### HSTS (HTTP Strict-Transport-Security)
###
### max-age=0 : disable
### max-age=31536000 : 1 year

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
/subsystem=undertow/configuration=filter/response-header=hsts-header:add(header-name="Strict-Transport-Security",header-value="max-age=31536000;")
/subsystem=undertow/server=default-server/host=default-host/filter-ref=hsts-header:add()
run-batch
quit
EOF
}

######################################################################

add_filter
