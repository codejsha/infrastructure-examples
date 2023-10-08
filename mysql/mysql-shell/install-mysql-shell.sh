#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### requirement: mysql yum repository

INSTALL_FILE_DIR="/mnt/share/oracle-mysql/repo"
# INSTALL_FILE="mysql80-community-release-el7-3.noarch.rpm"
INSTALL_FILE="mysql80-community-release-el8-3.noarch.rpm"
# INSTALL_FILE="mysql-apt-config_0.8.16-1_all.deb"

### rhel - dnf
# sudo rpm -ivh ${INSTALL_FILE_DIR}/${INSTALL_FILE}
sudo rpm -Uvh ${INSTALL_FILE_DIR}/${INSTALL_FILE}
sudo dnf install -y mysql-shell

### rhel - yum
# sudo rpm -ivh ${INSTALL_FILE_DIR}/${INSTALL_FILE}
# sudo rpm -Uvh ${INSTALL_FILE_DIR}/${INSTALL_FILE}
# sudo yum install -y mysql-shell

### ubuntu
# sudo dpkg -i ${INSTALL_FILE_DIR}/${INSTALL_FILE}
# sudo apt-get install -y mysql-shell
