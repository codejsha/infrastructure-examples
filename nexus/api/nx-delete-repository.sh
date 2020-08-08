#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME=""

curl --insecure \
    -X DELETE "${NEXUS_URL}/service/rest/beta/repositories/${REPOSITORY_NAME}" \
    -H "accept: application/json" \
    --user ${NEXUS_USER}:${NEXUS_PASSWORD}
