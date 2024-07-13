#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

sudo mkdir -p /usr/java
sudo chown -R $(id -un):$(id -gn) /usr/java

function install_oracle_jdk17() {
    local INSTALL_FILE_DIR="/mnt/share/oracle-jdk/17"
    local INSTALL_FILE="jdk-17.0.7_linux-x64_bin.tar.gz"

    tar -C /usr/java -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}

    ln -snf /usr/java/jdk-17.0.7 /usr/java/java-17
}
# install_oracle_jdk17
# ln -snf /usr/java/java-17 /usr/java/current

function install_oracle_jdk11() {
    local INSTALL_FILE_DIR="/mnt/share/oracle-jdk/11"
    local INSTALL_FILE="jdk-11.0.12_linux-x64_bin.tar.gz"

    tar -C /usr/java -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}

    ln -snf /usr/java/jdk-11.0.12 /usr/java/java-11
}
# install_oracle_jdk11
# ln -snf /usr/java/java-11 /usr/java/current

function install_oracle_jdk8() {
    local INSTALL_FILE_DIR="/mnt/share/oracle-jdk/8"
    local INSTALL_FILE="jdk-8u301-linux-x64.tar.gz"

    tar -C /usr/java -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}

    ln -snf /usr/java/jdk1.8.0_301 /usr/java/java-1.8.0
}
# install_oracle_jdk8
# ln -snf /usr/java/java-1.8.0 /usr/java/current

function install_oracle_jdk7() {
    local INSTALL_FILE_DIR="/mnt/share/oracle-jdk/7"
    local INSTALL_FILE="jdk-7u311-linux-x64.tar.gz"

    tar -C /usr/java -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}

    ln -snf /usr/java/jdk1.7.0_311 /usr/java/java-1.7.0
}
# install_oracle_jdk7
# ln -snf /usr/java/java-1.7.0 /usr/java/current

function install_oracle_jdk6() {
    local INSTALL_FILE_DIR="/mnt/share/oracle-jdk/6"
    local INSTALL_FILE="jdk-6u211-linux-x64.bin"

    cp ${INSTALL_FILE_DIR}/${INSTALL_FILE} /usr/java
    cd /usr/java
    bash ./${INSTALL_FILE}
    rm ${INSTALL_FILE}

    ln -snf /usr/java/jdk1.6.0_211 /usr/java/java-1.6.0
}
# install_oracle_jdk6
# ln -snf /usr/java/java-1.6.0 /usr/java/current
