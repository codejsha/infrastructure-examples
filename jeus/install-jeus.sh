#!/bin/bash

INSTALL_FILE_DIR="/mnt/share/tmax-jeus"
INSTALL_FILE="jeus7_unix_generic_ko.bin"
INSTALL_SCRIPT_DIR="/svc/infrastructure/jeus"

${INSTALL_FILE_DIR}/${INSTALL_FILE} -f ${INSTALL_SCRIPT_DIR}/jeus_install_linux.properties
