#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
BLOBSTORE_NAME="${1}"

function delete_blob_store {
    curl --insecure \
        -X DELETE "${NEXUS_URL}/service/rest/beta/blobstores/${BLOBSTORE_NAME}" \
        -H "accept: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

delete_blob_store
