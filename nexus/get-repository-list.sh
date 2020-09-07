#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"

function get_repository_list {
    curl --insecure \
        -X GET "${NEXUS_URL}/service/rest/beta/repositories" \
        -H "accept: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD}
    # curl --insecure \
    #     -X GET "${NEXUS_URL}/service/rest/v1/repositories" \
    #     -H "accept: application/json" \
    #     --user ${NEXUS_USER}:${NEXUS_PASSWORD}
}

get_repository_list
