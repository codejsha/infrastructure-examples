#!/bin/bash

JAVA_HOME="/usr/java/java-11"
# JAVA_HOME="/usr/java/java-1.8.0"
export JAVA_HOME

SHARE_DIR="/mnt/share"

if [ -z ${JAVA_HOME} ] || [ ! -e ${JAVA_HOME}/bin/jar ]; then
    echo "[ERROR] The JAVA_HOME (${JAVA_HOME}) does not exist!"
    exit 1
fi

rm -rf wlsdeploy
mkdir -p wlsdeploy/applications

/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/failovertest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/jdbcdrivertest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/cachetest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/session-persistence-failover-app wlsdeploy/applications/

${JAVA_HOME}/bin/jar -cf archive.zip wlsdeploy
