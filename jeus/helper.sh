#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

JEUS_HOME="/usr/local/jeus"
INSTALL_SCRIPT_DIR="/svc/infrastructure/jeus"

######################################################################

### escape forward slash
JEUS_HOME="${JEUS_HOME//\//\\/}"
INSTALL_SCRIPT_DIR="${INSTALL_SCRIPT_DIR//\//\\/}"

######################################################################

find . -name "*.sh" | xargs perl -pi -e "s/^JEUS_HOME=.*/JEUS_HOME=\"${JEUS_HOME}\"/"
perl -pi -e "s/^INSTALL_SCRIPT_DIR=.*/INSTALL_SCRIPT_DIR=\"${INSTALL_SCRIPT_DIR}\"/" install-jeus.sh
perl -pi -e "s/^USER_INSTALL_DIR=.*/USER_INSTALL_DIR=${JEUS_HOME}/" jeus_install_linux.properties
