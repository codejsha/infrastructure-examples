#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function install_confluent_kafka() {
    local PARENT_CONFLUENT_HOME="/opt/confluent"
    local INSTALL_FILE_DIR="/mnt/share/confluent-platform"
    local INSTALL_FILE="confluent-7.2.1.tar.gz"

    local CONFLUENT_VERSION="$(echo ${INSTALL_FILE} | grep -o -E "([^confluent-].*[^\.tar\.gz])")"
    local CONFLUENT_MAJOR_VERSION="$(echo ${CONFLUENT_VERSION} | grep -o -E "^[0-9]\.[0-9]")"
    local CONFLUENT_HOME="${PARENT_CONFLUENT_HOME}/confluent-${CONFLUENT_VERSION}"

    function check_install_home {
        if [ -d "${CONFLUENT_HOME}" ]; then
            echo "[ERROR] The CONFLUENT_HOME (${CONFLUENT_HOME}) already exists!"
            exit
        fi
    }

    function download_install_file {
        if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
            sudo curl -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} \
                -LJO https://packages.confluent.io/archive/${CONFLUENT_MAJOR_VERSION}/${INSTALL_FILE}
        fi
    }

    function check_install_file_exist {
        if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
            echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
            exit
        fi
    }

    function check_install_file_corrupt {
        if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
            echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
            exit
        fi
    }

    function install_confluent {
        sudo tar -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE} -C ${PARENT_CONFLUENT_HOME}
        sudo mv ${PARENT_CONFLUENT_HOME}/confluent-${CONFLUENT_VERSION} ${CONFLUENT_HOME}
        sudo chown -R $(id -un):$(id -gn) ${CONFLUENT_HOME}
    }

    function install_bash_completion {
        sudo yum install -y bash-completion
        sudo /usr/local/confluent/bin/confluent completion bash | sudo tee /etc/bash_completion.d/confluent
    }

    check_install_home
    download_install_file
    check_install_file
    install_confluent
    install_bash_completion
}

######################################################################

install_confluent_kafka

### variables
# export CONFLUENT_HOME="/usr/local/confluent"
# export PATH="${PATH}:${CONFLUENT_HOME}/bin"
