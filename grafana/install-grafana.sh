#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

GRAFANA_HOME="/usr/local/grafana"
# LOG_DIR="${GRAFANA_HOME}"

INSTALL_FILE_DIR="/mnt/share/grafana"
INSTALL_FILE="grafana-8.0.3.linux-amd64.tar.gz"

GRAFANA_VERSION="$(echo ${INSTALL_FILE} | grep -o -E "[0-9]*\.[0-9]*\.[0-9]*")"
PARENT_GRAFANA_HOME="$(readlink --canonicalize-missing ${GRAFANA_HOME}/../)"
GRAFANA_DIR_NAME="grafana-${GRAFANA_VERSION}"

### check install home
if [ -d "${GRAFANA_HOME}" ]; then
    echo "[ERROR] The GRAFANA_HOME (${GRAFANA_HOME}) already exists!"
    exit
fi

### download install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -LJO https://dl.grafana.com/oss/release/${INSTALL_FILE}
fi

### check install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
    exit
fi

### install
sudo tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_GRAFANA_HOME}
cd ${PARENT_GRAFANA_HOME}
sudo ln -snf ${GRAFANA_DIR_NAME} grafana

### copy config files
/bin/cp -pf dashboard.yml ${PROMETHEUS_HOME}/conf/provisioning/dashboards

### change ownership
cd ${PARENT_GRAFANA_HOME}
sudo chown -R $(id -un):$(id -gn) ${GRAFANA_HOME}
sudo chown -R $(id -un):$(id -gn) grafana

### create log directory
# if [ ! -d "${LOG_DIR}/backup" ]; then
#     mkdir -p ${LOG_DIR}/backup
# fi
