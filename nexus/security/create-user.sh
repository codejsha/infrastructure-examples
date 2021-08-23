#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NEXUS_URL="http://nexus.example.com"
# NEXUS_URL="https://nexus.example.com""
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

USER_ID="${1}"
USER_PASSWORD="${2}"
USER_FIRSTNAME="${USER_ID}"
USER_LASTNAME="${USER_ID}"
USER_EMAIL="${USER_ID}@example.com"
USER_ROLES="nx-admin"

export NEXUS_URL NEXUS_USER NEXUS_PASSWORD
export USER_ID USER_PASSWORD USER_FIRSTNAME USER_LASTNAME USER_EMAIL USER_ROLES
envsubst < ./data-user.json > ./data-user-temp.json

######################################################################

function create_user {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        --request POST \
        --header "Accept:application/json" \
        --header "Content-Type:application/json" \
        --data @data-user-temp.json \
        ${NEXUS_URL}/service/rest/beta/security/users
}

######################################################################

create_user
