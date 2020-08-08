#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
BLOBSTORE_NAME=""

### fetch s3 blobstore
curl --insecure \
    -X GET "${NEXUS_URL}/service/rest/beta/blobstores/s3/${BLOBSTORE_NAME}" \
    -H "accept: application/json" \
    --user ${NEXUS_USER}:${NEXUS_PASSWORD}
