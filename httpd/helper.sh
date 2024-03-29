#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

HTTPD_HOME="/usr/local/httpd"

######################################################################

### escape forward slash
HTTPD_HOME="${HTTPD_HOME//\//\\/}"

######################################################################

perl -pi -e "s/HTTPD_HOME=.*/HTTPD_HOME=\"${HTTPD_HOME}\"/" install-httpd.sh
perl -pi -e "s/^HTTPD_HOME=.*/HTTPD_HOME=\"${HTTPD_HOME}\"/" env-base.sh
