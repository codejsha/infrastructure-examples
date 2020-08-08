#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
REPOSITORY_NAME=""
BLOBSTORE_NAME=""

### proxy repository only
REMOTE_URL="https://registry-1.docker.io"
### group repository only
MEMBER_NAMES="\"REPOSITORY1\",\"REPOSITORY2\""

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

function create_docker_hosted_repository {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/repositories/docker/hosted" \
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
          \"docker\": { \
            \"v1Enabled\": false, \
            \"forceBasicAuth\": false, \
            \"httpPort\": 5003, \
            \"httpsPort\": null \
          } \
        }"
}

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
            \"memberNames\": [${MEMBER_NAMES}] \
          }, \
          \"docker\": { \
            \"v1Enabled\": false, \
            \"forceBasicAuth\": false, \
            \"httpPort\": null, \
            \"httpsPort\": null \
          } \
        }"
}

create_docker_proxy_repository
# create_docker_hosted_repository
# create_docker_group_repository
