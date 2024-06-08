#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

JAVA_HOME="/usr/java/java-11"
# JAVA_HOME="/usr/java/java-1.8.0"
export JAVA_HOME

SHARE_DIR="/mnt/share"

if [ -z ${JAVA_HOME} ] || [ ! -e ${JAVA_HOME}/bin/jar ]; then
    echo "[ERROR] The JAVA_HOME (${JAVA_HOME}) does not exist!"
    exit 1
fi

### reset wlsdeploy
rm -rf wlsdeploy

### applications
mkdir -p wlsdeploy/applications
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/cachetest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/failovertest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/jdbctest wlsdeploy/applications/
/bin/cp -rf ${SHARE_DIR}/app/weblogic-application/session-persistence-app wlsdeploy/applications/
### wls-exporter
/bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/weblogic-monitoring-exporter/get2.0.sh wlsdeploy/applications/
cd wlsdeploy/applications
bash ./get2.0.sh
bash ./get2.0.sh ../../wls-exporter-config.yaml
rm -f get2.0.sh
cd ../../

### classpathLibraries
mkdir -p wlsdeploy/classpathLibraries
/bin/cp -rf ${SHARE_DIR}/oracle-mysql/connector/mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar wlsdeploy/classpathLibraries/
/bin/cp -rf ${SHARE_DIR}/tmax-tibero/tibero6-jdbc-driver/tibero6-jdbc.jar wlsdeploy/classpathLibraries/

${JAVA_HOME}/bin/jar -cf archive.zip wlsdeploy
${JAVA_HOME}/bin/jar -tvf archive.zip
