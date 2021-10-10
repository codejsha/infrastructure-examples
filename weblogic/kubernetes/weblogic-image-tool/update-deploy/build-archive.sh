#!/bin/bash

if [ -z ${JAVA_HOME} ] || [ ! -e ${JAVA_HOME}/bin/jar ]; then
    echo "[ERROR] The JAVA_HOME (${JAVA_HOME}) does not exist!"
    exit 1
fi

SCRIPT_DIR="$( cd "$( dirname $0 )" && pwd )"
if [ ! -d ${SCRIPT_DIR} ]; then
    echo "Unable to determine the script directory (${SCRIPT_DIR})"
    exit 1
fi

rm -rf ${SCRIPT_DIR}/archive
mkdir -p ${SCRIPT_DIR}/archive/wlsdeploy/applications

${JAVA_HOME}/bin/jar -cf ${SCRIPT_DIR}/archive.zip -C ${SCRIPT_DIR}/archive wlsdeploy
