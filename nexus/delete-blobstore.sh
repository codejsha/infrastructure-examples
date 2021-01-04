#!/bin/bash

NEXUS_URL="https://nexus.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
BLOBSTORE_NAME="${1}"

function delete_blob_store {
    curl --insecure \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        -X DELETE "${NEXUS_URL}/service/rest/beta/blobstores/${BLOBSTORE_NAME}" \
        -H "Accept:application/json"
}

delete_blob_store
