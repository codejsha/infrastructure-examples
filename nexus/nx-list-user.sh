#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

curl --insecure \
    -X GET "${NEXUS_URL}/service/rest/beta/security/users" \
    -H "accept: application/json" \
    --user ${NEXUS_USER}:${NEXUS_PASSWORD}
