#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

ORACLE_HOME="/usr/local/ohs"
MW_HOME="${ORACLE_HOME}"
DOMAIN_NAME="base_domain"
DOMAIN_HOME="${ORACLE_HOME}/user_projects/domains/${DOMAIN_NAME}"
NODE_MANAGER_NAME="localmachine"
NODE_MANAGER_LISTEN_ADDRESS="localhost"
NODE_MANAGER_LISTEN_PORT="5556"
NODE_MANAGER_USERNAME="ohs"
NODE_MANAGER_PASSWORD="welcome1"
LOG_DIR="${DOMAIN_HOME}/logs"

export ORACLE_HOME MW_HOME
export DOMAIN_NAME DOMAIN_HOME
export NODE_MANAGER_NAME NODE_MANAGER_LISTEN_ADDRESS NODE_MANAGER_LISTEN_PORT NODE_MANAGER_USERNAME NODE_MANAGER_PASSWORD
export LOG_DIR

INSTALL_SCRIPT_DIR="/svc/infrastructure/ohs"
