#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

CREDENTIALS_ALIAS="baseds1-password"
CREDENTIALS_SECRET_VALUE="${PASSWORD}"

######################################################################

function print_help {
    echo ""
    echo "Usage:"
    echo "  --alias|--alias=              : set the alias"
    echo "  --secret-value|--secret-value= : set the secret value"
}

function set_arguments {
    while [[ ${#} -gt 0 ]]
    do
        ARGS="${1}"
        shift
        case "${ARGS}" in
            "--help")           print_help;                                 exit;;
            "--alias")          CREDENTIALS_ALIAS="${1}";                   shift;;
            "--alias="*)        CREDENTIALS_ALIAS="${ARGS#*=}";             ;;
            "--secret-value")   CREDENTIALS_SECRET_VALUE="${1}";            shift;;
            "--secret-value="*) CREDENTIALS_SECRET_VALUE="${ARGS#*=}";      ;;
        esac
    done
}

######################################################################

set_arguments ${@}
