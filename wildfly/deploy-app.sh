#!/usr/bin/bash

source ./env-base.sh

APP_PATH="/svc/app/test"
APP_NAME="test.war"
APP_RUNTIME_NAME="test.war"

${WILDFLY_HOME}/bin/jboss-cli.sh \
    --connect \
    --controller=${LISTEN_ADDRESS}:${MGMT_HTTP_PORT} \
    --command="deploy ${APP_PATH} --name=${APP_NAME} --runtime-name=${APP_RUNTIME_NAME} --unmanaged"

### check deployment status
${WILDFLY_HOME}/bin/jboss-cli.sh \
    --connect \
    --controller=${LISTEN_ADDRESS}:${MGMT_HTTP_PORT} \
    --command="deploy -l"
# ${WILDFLY_HOME}/bin/jboss-cli.sh \
#     --connect \
#     --controller=${LISTEN_ADDRESS}:${MGMT_HTTP_PORT} \
#     --command="deployment-info --name=${APP_NAME}"
