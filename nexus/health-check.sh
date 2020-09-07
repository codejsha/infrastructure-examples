#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

function status {
    curl --insecure \
        --head \
        -X GET "${NEXUS_URL}/service/rest/v1/status" \
        -H "accept: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

function status_check {
    # curl --insecure \
    #     -X GET "${NEXUS_URL}/service/rest/v1/status/check" \
    #     -H "accept: application/json" \
    #     --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

status
# status_check
