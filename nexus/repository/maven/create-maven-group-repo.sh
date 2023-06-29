#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NEXUS_URL="http://nexus.example.com"
# NEXUS_URL="https://nexus.example.com""
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME="${1}"
BLOBSTORE_NAME="${2}"
REPOSITORY_MEMBER_NAMES="${3}"

export NEXUS_URL NEXUS_USER NEXUS_PASSWORD
export REPOSITORY_NAME BLOBSTORE_NAME REPOSITORY_MEMBER_NAMES
envsubst < ./data-maven-group-repo.json > ./data-maven-group-repo-temp.json

######################################################################

function create_maven_group_repository() {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        --request POST \
        --header "Accept:application/json" \
        --header "Content-Type:application/json" \
        --data @data-maven-group-repo-temp.json \
        ${NEXUS_URL}/service/rest/beta/repositories/maven/group
}

######################################################################

create_maven_group_repository
