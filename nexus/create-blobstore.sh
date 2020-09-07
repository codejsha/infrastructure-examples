#!/usr/bin/bash

NEXUS_URL="https://nexus.kube.example.com"
NEXUS_USER="admin"
NEXUS_PASSWORD="admin123"
BLOBSTORE_NAME="${1}"

AWS_ACCESS_KEY_ID="admin"
AWS_SECRET_ACCESS_KEY="changeit"
AWS_ENDPOINT_URL="http://10.10.10.52:9000"
BUCKET_NAME="${BLOBSTORE_NAME}"

function create_s3_blob_store {
    curl --insecure \
        -X POST "${NEXUS_URL}/service/rest/beta/blobstores/s3" \
        -H "accept: application/json" \
        -H "Content-Type: application/json" \
        --user ${NEXUS_USER}:${NEXUS_PASSWORD} \
        -d \
        "{ \
          \"name\": \"${BLOBSTORE_NAME}\", \
          \"softQuota\": null, \
          \"bucketConfiguration\": { \
            \"bucket\": { \
              \"region\": \"us-east-1\", \
              \"name\": \"${BUCKET_NAME}\", \
              \"prefix\": \"\", \
              \"expiration\": 3 \
            }, \
            \"bucketSecurity\": { \
              \"accessKeyId\": \"${AWS_ACCESS_KEY_ID}\", \
              \"secretAccessKey\": \"${AWS_SECRET_ACCESS_KEY}\", \
              \"role\": \"\", \
              \"sessionToken\": \"\" \
            }, \
            \"advancedBucketConnection\": { \
              \"endpoint\": \"${AWS_ENDPOINT_URL}\", \
              \"signerType\": \"AWSS3V4SignerType\", \
              \"forcePathStyle\": true \
            } \
          } \
        }"
}

create_s3_blob_store
