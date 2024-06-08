#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

PROMETHEUS_HOME="/usr/local/prometheus"
# LOG_DIR="${PROMETHEUS_HOME}"

INSTALL_FILE_DIR="/mnt/share/prometheus"
INSTALL_FILE="prometheus-2.25.2.linux-amd64.tar.gz"

PROMETHEUS_VERSION="$(echo ${INSTALL_FILE} | grep -o -E "[0-9]*\.[0-9]*\.[0-9]*")"
PARENT_PROMETHEUS_HOME="$(readlink --canonicalize-missing ${PROMETHEUS_HOME}/../)"
PROMETHEUS_DIR_NAME="${INSTALL_FILE/\.tar\.gz/}"

### check install home
if [ -d "${PROMETHEUS_HOME}" ]; then
    echo "[ERROR] The PROMETHEUS_HOME (${PROMETHEUS_HOME}) already exists!"
    exit
fi

### download install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -LJO https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/${INSTALL_FILE}
fi

### check install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
    exit
fi

### install
sudo tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_PROMETHEUS_HOME}
cd ${PARENT_PROMETHEUS_HOME}
sudo ln -snf ${PROMETHEUS_DIR_NAME} prometheus

### copy config files
/bin/cp -pf prometheus.yml ${PROMETHEUS_HOME}
/bin/cp -pf start-prometheus.sh ${PROMETHEUS_HOME}
/bin/cp -pf stop-prometheus.sh ${PROMETHEUS_HOME}

### change ownership
cd ${PARENT_PROMETHEUS_HOME}
sudo chown -R $(id -un):$(id -gn) ${PROMETHEUS_HOME}
sudo chown -R $(id -un):$(id -gn) prometheus

### create log directory
# if [ ! -d "${LOG_DIR}/backup" ]; then
#     mkdir -p ${LOG_DIR}/backup
# fi
