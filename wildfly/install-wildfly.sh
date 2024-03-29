#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ./env-base.sh

INSTALL_FILE_DIR="/mnt/share/wildfly"

# INSTALL_FILE="wildfly-17.0.1.Final.zip"
# INSTALL_FILE="wildfly-19.0.0.Final.zip"
# INSTALL_FILE="wildfly-20.0.0.Final.zip"
INSTALL_FILE="wildfly-20.0.1.Final.tar.gz"

######################################################################

PARENT_JBOSS_HOME="$(readlink --canonicalize-missing ${JBOSS_HOME}/../)"
JBOSS_DIR_NAME="${INSTALL_FILE/\.tar\.gz/}"

######################################################################

function check_jboss_home() {
    if [ -d "${JBOSS_HOME}" ]; then
        echo "[ERROR] The JBOSS_HOME (${JBOSS_HOME}) already exists!"
        exit
    fi
}

function check_install_file() {
    if [ ! -f "${INSTALL_FILE_DIR}/${INSTALL_FILE}" ]; then
        echo "[ERROR] The install file (${INSTALL_FILE_DIR}/${INSTALL_FILE}) does not exist!"
        exit
    fi
}

function install_wildfly() {
    sudo tar -C ${PARENT_JBOSS_HOME} -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}
    sudo mv ${PARENT_JBOSS_HOME}/${JBOSS_DIR_NAME} ${JBOSS_HOME}
    sudo chown -R $(id -un):$(id -gn) ${JBOSS_HOME}
}

######################################################################

check_jboss_home
check_install_file
install_wildfly
