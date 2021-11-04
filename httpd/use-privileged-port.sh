#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# setenforce 0
# sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

HTTPD_HOME="/usr/local/httpd"

sudo chown root ${HTTPD_HOME}/bin/httpd
sudo chmod 4750 ${HTTPD_HOME}/bin/httpd
