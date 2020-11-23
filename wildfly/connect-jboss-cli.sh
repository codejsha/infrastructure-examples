#!/bin/bash

source ./env-base.sh

JBOSS_HOME="${JBOSS_HOME}"
BIND_ADDRESS_MGMT="${BIND_ADDRESS_MGMT}"
JBOSS_MGMT_HTTP_PORT="${JBOSS_MGMT_HTTP_PORT}"

COMMAND=""   # default

######################################################################

function connect_jboss_cli {
    if [ -z "${COMMAND}" ]; then
        ${JBOSS_HOME}/bin/jboss-cli.sh \
            --connect \
            --controller="${BIND_ADDRESS_MGMT}:${JBOSS_MGMT_HTTP_PORT}"
    else
        COMMAND="${1}"
        ${JBOSS_HOME}/bin/jboss-cli.sh \
            --connect \
            --controller="${BIND_ADDRESS_MGMT}:${JBOSS_MGMT_HTTP_PORT}" \
            --command="${COMMAND}"
    fi
}

######################################################################

function print_help {
    echo "  --command|--command=          : set a command."
}

function set_arguments {
    while [[ $# -gt 0 ]]
    do
        ARGS="${1}"
        shift
        case "${ARGS}" in
            "--help")
                print_help; exit;;
            "--command")
                COMMAND="${1}"; shift;;
            "--command="*)
                COMMAND="${ARGS#*=}";;
        esac
    done
}

######################################################################

set_arguments ${@}

connect_jboss_cli ${COMMAND}
