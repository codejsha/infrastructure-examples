#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NEXUS_URL="http://nexus.example.com"
# NEXUS_URL="https://nexus.example.com""
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
BLOBSTORE_NAME="${1}"
BUCKET_NAME="${BLOBSTORE_NAME}"

AWS_ACCESS_KEY="${AWS_ACCESS_KEY}"
AWS_SECRET_KEY="${AWS_SECRET_KEY}"
# AWS_ENDPOINT_URL="http://10.10.10.52:9001"
AWS_ENDPOINT_URL="http://minio.example.com"
# AWS_ENDPOINT_URL="https://minio-tenant-1.example.com"

export NEXUS_URL NEXUS_USER NEXUS_PASSWORD
export BLOBSTORE_NAME BUCKET_NAME
export AWS_ACCESS_KEY AWS_SECRET_KEY AWS_ENDPOINT_URL
envsubst < ./data-blobstore.json > ./data-blobstore-temp.json

######################################################################

function create_s3_blob_store() {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        --request POST \
        --header "Accept:application/json" \
        --header "Content-Type:application/json" \
        --data @data-blobstore-temp.json \
        ${NEXUS_URL}/service/rest/beta/blobstores/s3
}

######################################################################

create_s3_blob_store
