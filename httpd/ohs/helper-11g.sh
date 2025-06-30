#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

MW_HOME="/usr/local/ohs"
ORACLE_HOME="${MW_HOME}/oracle_wt1"
INSTANCE_NAME="instance1"
INSTALL_SCRIPT_DIR="${HOME}/repos/infrastructure-examples/ohs"

######################################################################

### escape forward slash
MW_HOME="${MW_HOME//\//\\/}"
ORACLE_HOME="${ORACLE_HOME//\//\\/}"
INSTANCE_NAME="${INSTANCE_NAME//\//\\/}"

perl -pi -e "s/^MIDDLEWARE_HOME=.*/MIDDLEWARE_HOME=${MW_HOME}/" ${INSTALL_SCRIPT_DIR}/response-sw-only-11g.rsp
perl -pi -e "s/^ORACLE_HOME=.*/ORACLE_HOME=${ORACLE_HOME}/" ${INSTALL_SCRIPT_DIR}/response-sw-only-11g.rsp

### escape forward slash
INSTALL_SCRIPT_DIR="${INSTALL_SCRIPT_DIR//\//\\/}"

perl -pi -e "s/^MW_HOME=.*/MW_HOME=\"${MW_HOME}\"/" env-base.sh
perl -pi -e "s/^ORACLE_HOME=.*/ORACLE_HOME=\"${ORACLE_HOME}\"/" env-base.sh
perl -pi -e "s/^INSTANCE_NAME=.*/INSTANCE_NAME=\"${INSTANCE_NAME}\"/" env-base.sh
perl -pi -e "s/^INSTALL_SCRIPT_DIR=.*/INSTALL_SCRIPT_DIR=\"${INSTALL_SCRIPT_DIR}\"/" env-base.sh
