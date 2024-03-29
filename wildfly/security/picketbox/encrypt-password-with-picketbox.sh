#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh

JAVA_HOME="${JAVA_HOME}"
JBOSS_HOME="${JBOSS_HOME}"

PLAINTEXT_PASSWORD="${1}"

${JAVA_HOME}/bin/java \
    -classpath ${JBOSS_HOME}/modules/system/layers/base/org/picketbox/main/picketbox-5.0.3.Final-redhat-00005.jar \
    org.picketbox.datasource.security.SecureIdentityLoginModule ${PLAINTEXT_PASSWORD}
