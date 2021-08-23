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

export NEXUS_URL NEXUS_USER NEXUS_PASSWORD
export REPOSITORY_NAME BLOBSTORE_NAME REMOTE_URL
envsubst < ./data-helm-proxy-repo.json > ./data-helm-proxy-repo-temp.json

######################################################################

function create_helm_proxy_repository {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        --request POST \
        --header "Accept:application/json" \
        --header "Content-Type:application/json" \
        --data @data-helm-proxy-repo-temp.json \
        ${NEXUS_URL}/service/rest/beta/repositories/helm/proxy
}

######################################################################

create_helm_proxy_repository
