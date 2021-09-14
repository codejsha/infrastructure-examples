#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

PLAINTEXT_PASSWORD="${PASSWORD}"
VAULT_BLOCK="block"
VAULT_ATTRIBUTE="password"
VAULT_SALT="1234abcd"

######################################################################

function print_help {
    echo ""
    echo "Usage:"
    echo "  --password|--password=        : set the alias"
}

function set_arguments {
    while [[ $# -gt 0 ]]
    do
        ARGS="${1}"
        shift
        case "${ARGS}" in
            "--help")           print_help;                         exit;;
            "--block")          VAULT_BLOCK="${1}";                 shift;;
            "--block="*)        VAULT_BLOCK="${ARGS#*=}";           ;;
            "--attribute")      VAULT_ATTRIBUTE="${1}";             shift;;
            "--attribute="*)    VAULT_ATTRIBUTE="${ARGS#*=}";       ;;
            "--password")       PLAINTEXT_PASSWORD="${1}";          shift;;
            "--password="*)     PLAINTEXT_PASSWORD="${ARGS#*=}";    ;;
        esac
    done
}

######################################################################

set_arguments ${@}
