#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME=""
BLOBSTORE_NAME=""

### proxy repository only
REMOTE_URL="http://chartmuseum.kube.example.com"

function create_helm_proxy_repository {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/repositories/helm/proxy" \
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
          \"cleanup\": null, \
          \"proxy\": { \
            \"remoteUrl\": \"${REMOTE_URL}\", \
            \"contentMaxAge\": -1, \
            \"metadataMaxAge\": 1440 \
          }, \
          \"negativeCache\": { \
            \"enabled\": true, \
            \"timeToLive\": 1440 \
          }, \
          \"httpClient\": { \
            \"blocked\": false, \
            \"autoBlock\": false, \
            \"connection\": { \
              \"retries\": null, \
              \"userAgentSuffix\": null, \
              \"timeout\": null, \
              \"enableCircularRedirects\": false, \
              \"enableCookies\": false \
            }, \
            \"authentication\": null \
          }, \
          \"routingRule\": null \
        }"
}

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

create_helm_proxy_repository
# create_helm_hosted_repository
