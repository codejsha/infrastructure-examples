#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME="${1}"
BLOBSTORE_NAME="${2}"

function create_helm_hosted_repository {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/repositories/helm/hosted" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        -d \
        "{ \
          \"name\": \"${REPOSITORY_NAME}\", \
          \"online\": true, \
          \"storage\": { \
            \"blobStoreName\": \"${BLOBSTORE_NAME}\", \
            \"strictContentTypeValidation\": true, \
            \"writePolicy\": \"ALLOW\" \
          }, \
          \"cleanup\": null \
        }"
}

create_helm_hosted_repository
