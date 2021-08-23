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
REMOTE_URL="${3}"
DOCKER_INDEX_TYPE="${4}"

export NEXUS_URL NEXUS_USER NEXUS_PASSWORD
export REPOSITORY_NAME BLOBSTORE_NAME REMOTE_URL
export DOCKER_INDEX_TYPE
envsubst < ./data-docker-proxy-repo.json > ./data-docker-proxy-repo-temp.json

######################################################################

function create_docker_proxy_repository {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        --request POST \
        --header "Accept:application/json" \
        --header "Content-Type:application/json" \
        --data @data-docker-proxy-repo-temp.json \
        ${NEXUS_URL}/service/rest/beta/repositories/docker/proxy
}

######################################################################

create_docker_proxy_repository
