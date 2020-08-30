#!/usr/bin/bash

source ./env-base.sh

### first only
# ${WILDFLY_HOME}/bin/jboss-cli.sh \
#     --connect \
#     --command="/interface=public:write-attribute(name=inet-address,value=\${jboss.bind.address:${LISTEN_ADDRESS}})"
# ${WILDFLY_HOME}/bin/jboss-cli.sh \
#     --connect \
#     --command="/interface=management:write-attribute(name=inet-address,value=\${jboss.bind.address:${LISTEN_ADDRESS}})"

${WILDFLY_HOME}/bin/jboss-cli.sh \
    --connect \
    --controller=${LISTEN_ADDRESS}:${MGMT_HTTP_PORT} \
    --command="/interface=public:write-attribute(name=inet-address,value=\${jboss.bind.address:${LISTEN_ADDRESS}})"
${WILDFLY_HOME}/bin/jboss-cli.sh \
    --connect \
    --controller=${LISTEN_ADDRESS}:${MGMT_HTTP_PORT} \
    --command="/interface=management:write-attribute(name=inet-address,value=\${jboss.bind.address:${LISTEN_ADDRESS}})"
