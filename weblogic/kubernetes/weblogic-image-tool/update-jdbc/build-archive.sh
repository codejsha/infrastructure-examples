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
mkdir -p wlsdeploy/domainLibraries

/bin/cp -rf ${SHARE_DIR}/oracle-mysql/connector/mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar \
    wlsdeploy/domainLibraries/
/bin/cp -rf ${SHARE_DIR}/tmax-tibero/tibero6-jdbc-driver/*.jar \
    wlsdeploy/domainLibraries/

${JAVA_HOME}/bin/jar -cf archive.zip wlsdeploy
