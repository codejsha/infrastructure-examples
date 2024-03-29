#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NODE_EXPORTER_HOME="/usr/local/node-exporter"
INSTALL_FILE_DIR="/mnt/share/prometheus/node-exporter"
INSTALL_FILE="node_exporter-1.3.1.linux-amd64.tar.gz"

NODE_EXPORTER_VERSION="$(echo ${INSTALL_FILE} | grep -o -E "[0-9]*\.[0-9]*\.[0-9]*")"
PARENT_NODE_EXPORTER_HOME="$(readlink --canonicalize-missing ${NODE_EXPORTER_HOME}/../)"
NODE_EXPORTER_DIR_NAME="${INSTALL_FILE/\.tar\.gz/}"

### check install home
if [ -d "${NODE_EXPORTER_HOME}" ]; then
    echo "[ERROR] The NODE_EXPORTER_HOME (${NODE_EXPORTER_HOME}) already exists!"
    exit
fi

### download install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
        -LJO https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/${INSTALL_FILE}
fi

### check install file
if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
    echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
    exit
fi

### install
sudo tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_NODE_EXPORTER_HOME}
cd ${PARENT_NODE_EXPORTER_HOME}
sudo ln -snf ${NODE_EXPORTER_DIR_NAME} node-exporter

### change ownership
cd ${PARENT_NODE_EXPORTER_HOME}
sudo chown -R $(id -un):$(id -gn) ${NODE_EXPORTER_HOME}
sudo chown -R $(id -un):$(id -gn) node-exporter
