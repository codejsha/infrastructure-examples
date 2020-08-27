#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME="${1}"
BLOBSTORE_NAME="${2}"
REMOTE_URL="${3}"

function create_docker_proxy_repository {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/repositories/docker/proxy" \
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
          \"routingRule\": null, \
          \"docker\": { \
            \"v1Enabled\": false, \
            \"forceBasicAuth\": false, \
            \"httpPort\": null, \
            \"httpsPort\": null \
          }, \
          \"dockerProxy\": { \
            \"indexType\": \"HUB\", \
            \"indexUrl\": null \
          } \
        }"
}

create_docker_proxy_repository
