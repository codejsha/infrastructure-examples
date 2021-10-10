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

/bin/cp -f ${SHARE_DIR}/app/failovertest wlsdeploy/applications/
/bin/cp -f ${SHARE_DIR}/app/jdbcdrivertest wlsdeploy/applications/
/bin/cp -f ${SHARE_DIR}/app/cachetest wlsdeploy/applications/
/bin/cp -f ${SHARE_DIR}/app/session-persistence-failover-app wlsdeploy/applications/

${JAVA_HOME}/bin/jar -cf archive.zip wlsdeploy
