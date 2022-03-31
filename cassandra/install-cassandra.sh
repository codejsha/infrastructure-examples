#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_cassandra  {
    local CASSANDRA_HOME="/usr/local/cassandra"
    local INSTALL_FILE_DIR="/mnt/share/apache-cassandra"
    local INSTALL_FILE="apache-cassandra-4.0.3-bin.tar.gz"

    local PARENT_CASSANDRA_HOME="$(readlink --canonicalize-missing ${CASSANDRA_HOME}/../)"
    local CASSANDRA_DIR_NAME="${INSTALL_FILE/-bin\.tar\.gz/}"

    ### check install home
    if [ -d "${CASSANDRA_HOME}" ]; then
        echo "[ERROR] The CASSANDRA_HOME (${CASSANDRA_HOME}) already exists!"
        exit
    fi

    ### download install file
    if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
        sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
            -LJO https://archive.apache.org/dist/cassandra/common/${CASSANDRA_DIR_NAME}/${INSTALL_FILE}
    fi

    ### check install file
    if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
        echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
        exit
    fi

    ### install
    sudo tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_CASSANDRA_HOME}
    cd ${PARENT_CASSANDRA_HOME}
    sudo ln -snf ${CASSANDRA_DIR_NAME} cassandra

    ### change ownership
    cd ${PARENT_CASSANDRA_HOME}
    sudo chown -R $(id -un):$(id -gn) ${CASSANDRA_HOME}
    sudo chown -R $(id -un):$(id -gn) cassandra
}

######################################################################

install_cassandra
