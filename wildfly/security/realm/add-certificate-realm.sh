#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh
source ./env-keystore.sh

######################################################################

function add_certificate_realm {
    ${JBOSS_HOME}/bin/jboss-cli.sh \
        --connect \
        --controller="${BIND_ADDRESS_MGMT}:${JBOSS_MGMT_HTTP_PORT}" \
        --user="${USERNAME}" \
        --password="${PASSWORD}" \
<<EOF
batch
/core-service=management/security-realm=CertificateRealm:add()
/core-service=management/security-realm=CertificateRealm/server-identity=ssl\
    :add(alias="${ALIAS}",\
        keystore-path="${KEYSTORE_PATH}",\
        keystore-password="${KEYSTORE_PASSWORD}")
/core-service=management/security-realm=CertificateRealm/authentication=truststore\
    :add(keystore-path="${KEYSTORE_PATH}",\
        keystore-password="${KEYSTORE_PASSWORD}")
run-batch
quit
EOF
}

function reload_server {
    ${JBOSS_HOME}/bin/jboss-cli.sh \
        --connect \
        --controller="${BIND_ADDRESS_MGMT}:${JBOSS_MGMT_HTTP_PORT}" \
        --user="${USERNAME}" \
        --password="${PASSWORD}" \
        --echo-command \
        --command=":reload()"
}

######################################################################

add_certificate_realm
reload_server
