#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

function get_available_realms_list {
    curl --insecure \
        -X GET "${NEXUS_URL}/service/rest/beta/security/realms/available" \
        -H "accept: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

get_available_realms_list
