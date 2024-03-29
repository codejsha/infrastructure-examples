#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

DRIVER_NAME="${DRIVER_NAME}"

######################################################################
### postgresql
######################################################################

DATASOURCE_NAME="baseds1"
JNDI_NAME="java:jboss/datasources/baseds1"
CONNECTION_URL="jdbc:postgresql://test.example.com:5432/postgres"
DS_USERNAME="postgres"
DS_PASSWORD="${PASSWORD}"
# DS_PASSWORD="postgres"
# DS_PASSWORD="\${VAULT::datasource::password::1}"
CHECK_VALID_CONNECTION_SQL="SELECT 1"




######################################################################
### oracle database
######################################################################

# DATASOURCE_NAME="baseds1"
# JNDI_NAME="java:jboss/datasources/baseds1"
# CONNECTION_URL="jdbc:oracle:thin:@test.example.com:1521:orclcdb"
# DS_USERNAME="system"
# DS_PASSWORD="${PASSWORD}"
# DS_PASSWORD="\${VAULT::datasource::password::1}"
# CHECK_VALID_CONNECTION_SQL="SELECT 1 FROM DUAL"
# CHECK_VALID_CONNECTION_SQL="SQL ISVALID"




ENABLED="true"
INITIAL_POOL_SIZE="30"
MIN_POOL_SIZE="30"
MAX_POOL_SIZE="30"
BACKGROUND_VALIDATION="true"
BACKGROUND_VALIDATION_MILLIS="120000"
BLOCKING_TIMEOUT_WAIT_MILLIS="2000"
QUERY_TIMEOUT="3600"
TRACK_STATEMENTS="true"
POOL_PREFILL="true"
POOL_USE_STRICT_MIN="true"
PREPARED_STATEMENTS_CACHE_SIZE="10"
SHARE_PREPARED_STATEMENTS="true"
USE_CCM="true"

######################################################################

function print_help() {
    echo "  --name|--name=                : set a datasource name"
}

function set_arguments() {
    while [[ ${#} -gt 0 ]]
    do
        ARGS="${1}"
        shift
        case "${ARGS}" in
            "--help")       print_help;                     exit;;
            "--name")       DATASOURCE_NAME="${1}";         shift;;
            "--name="*)     DATASOURCE_NAME="${ARGS#*=}";   ;;
        esac
    done
}

######################################################################

set_arguments "${@}"
