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

### applications
mkdir -p wlsdeploy/applications
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/failovertest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/jdbcdrivertest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/cachetest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/session-persistence-failover-app wlsdeploy/applications/

### classpathLibraries
mkdir -p wlsdeploy/classpathLibraries
/bin/cp -rf ${SHARE_DIR}/oracle-mysql/connector/mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar wlsdeploy/classpathLibraries/
/bin/cp -rf ${SHARE_DIR}/tmax-tibero/tibero6-jdbc-driver/tibero6-jdbc.jar wlsdeploy/classpathLibraries/

${JAVA_HOME}/bin/jar -cf archive.zip wlsdeploy
