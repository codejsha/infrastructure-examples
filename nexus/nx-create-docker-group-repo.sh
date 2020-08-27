#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME="${1}"
BLOBSTORE_NAME="${2}"
REPOSITORY_MEMBER_NAMES="${3}"

function create_docker_group_repository {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/repositories/docker/group" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        -d \
        "{ \
          \"name\": \"${REPOSITORY_NAME}\", \
          \"online\": true, \
          \"storage\": { \
            \"blobStoreName\": \"${BLOBSTORE_NAME}\", \
            \"strictContentTypeValidation\": true \
          }, \
          \"group\": { \
            \"memberNames\": [${REPOSITORY_MEMBER_NAMES}] \
          }, \
          \"docker\": { \
            \"v1Enabled\": false, \
            \"forceBasicAuth\": false, \
            \"httpPort\": 5003, \
            \"httpsPort\": null \
          } \
        }"
}

create_docker_group_repository
