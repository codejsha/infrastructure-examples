#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

LAG_EXPORTER_HOME="/usr/local/kafka-lag-exporter"
LAG_EXPORTER_CONFIG_FILE="${LAG_EXPORTER_HOME}/application.conf"
LAG_EXPORTER_LOGBACK_CONFIG_FILE="${LAG_EXPORTER_HOME}/logback.xml"
LOG_DIR="${LAG_EXPORTER_HOME}"

INSTALL_FILE_DIR="/mnt/share/kafka-lag-exporter"
INSTALL_FILE="kafka-lag-exporter-0.6.8.zip"
INSTALL_SCRIPT_DIR="/svc/infrastructure/kafka-lag-exporter"

LAG_EXPORTER_VERSION="$(echo ${INSTALL_FILE} | grep -o -E "[0-9]*\.[0-9]*\.[0-9]*")"
PARENT_LAG_EXPORTER_HOME="$(readlink --canonicalize-missing ${LAG_EXPORTER_HOME}/../)"
LAG_EXPORTER_DIR_NAME="kafka-lag-exporter-${LAG_EXPORTER_VERSION}"

### check install home
if [ -d "${LAG_EXPORTER_HOME}" ]; then
    echo "[ERROR] The LAG_EXPORTER_HOME (${LAG_EXPORTER_HOME}) already exists!"
    exit
fi

### download install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -LJO https://github.com/lightbend/kafka-lag-exporter/releases/download/v${LAG_EXPORTER_VERSION}/${INSTALL_FILE}
fi

### check install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
    exit
fi

### install
sudo unzip -d ${PARENT_LAG_EXPORTER_HOME} ${INSTALL_FILE_DIR}/${INSTALL_FILE}
cd ${PARENT_LAG_EXPORTER_HOME}
sudo ln -snf ${LAG_EXPORTER_DIR_NAME} kafka-lag-exporter
sudo chown -R $(id -un):$(id -gn) ${LAG_EXPORTER_HOME}

### create log directory
if [ ! -d "${LOG_DIR}/backup" ]; then
    mkdir -p ${LOG_DIR}/backup
fi

### copy config files
/bin/cp -pf ${LAG_EXPORTER_CONFIG_FILE} ${LAG_EXPORTER_HOME}
/bin/cp -pf ${LAG_EXPORTER_LOGBACK_CONFIG_FILE} ${LAG_EXPORTER_HOME}
