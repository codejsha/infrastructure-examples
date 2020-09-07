#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

function get_blob_store_list {
    curl --insecure \
        -X GET "${NEXUS_URL}/service/rest/beta/blobstores" \
        -H "accept: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

get_blob_store_list
