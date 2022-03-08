#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

AWS_ACCESS_KEY="minio"
AWS_SECRET_KEY="minio123"

MINIO_ALIAS="minio-tenant-1"
MINIO_URL="https://minio-tenant-1.example.com"
mc config host add ${MINIO_ALIAS} ${MINIO_URL} ${AWS_ACCESS_KEY} ${AWS_SECRET_KEY} --api s3v4
mc config host ls

MINIO_ALIAS="my-minio"
MINIO_URL="http://minio.example.com"
mc config host add ${MINIO_ALIAS} ${MINIO_URL} ${AWS_ACCESS_KEY} ${AWS_SECRET_KEY} --api s3v4
mc config host ls

MINIO_ALIAS="test-minio"
MINIO_URL="http://test.example.com:9001"
mc config host add ${MINIO_ALIAS} ${MINIO_URL} ${AWS_ACCESS_KEY} ${AWS_SECRET_KEY} --api s3v4
mc config host ls
