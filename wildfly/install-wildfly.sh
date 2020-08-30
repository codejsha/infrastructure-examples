#!/usr/bin/bash

source ./env-base.sh

INSTALL_FILE_DIR="/mnt/share/wildfly"
# INSTALL_FILE_DIR="/mnt/share/redhat-jboss-eap"

INSTALL_FILE="wildfly-20.0.1.Final.tar.gz"
# INSTALL_FILE="jboss-eap-7.2.0.zip"
# INSTALL_FILE="jboss-eap-7.3.0.zip"

PARENT_WILDFLY_HOME="$(readlink --canonicalize-missing ${WILDFLY_HOME}/../)"
# unzip -q -o ${INSTALL_FILE_DIR}/${INSTALL_FILE} -d ${PARENT_WILDFLY_HOME}
tar -C ${PARENT_WILDFLY_HOME} -xzf ${INSTALL_FILE_DIR}/${INSTALL_FILE}

WILDFLY_DIR=${INSTALL_FILE/\.tar\.gz/}
WILDFLY_DIR=${INSTALL_FILE/\.zip/}
mv ${PARENT_WILDFLY_HOME}/${WILDFLY_DIR} ${WILDFLY_HOME}
