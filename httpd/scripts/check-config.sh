#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
export PS4="\e[33;1m+ \e[0m"
set -o errexit
set -o errtrace
set -o xtrace

HTTPD_HOME="/usr/local/httpd"
source ${HTTPD_HOME}/envvars.sh

${HTTPD_HOME}/bin/apachectl -d ${HTTPD_HOME} -f ${HTTPD_HOME}/conf/httpd.conf -t
