#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

USERNAME="minio"
PASSWORD="minio123"

MINIO_VOLUME_DIR="/mnt/volume/minio"
sudo mkdir -p ${MINIO_VOLUME_DIR}

docker container run \
    --detach \
    --name minio \
    --publish 9000:9000 \
    --publish 9001:9001 \
    --env MINIO_ROOT_USER="${USERNAME}" \
    --env MINIO_ROOT_PASSWORD="${PASSWORD}" \
    --mount type="bind",src="${MINIO_VOLUME_DIR}",dst="/data" \
    minio/minio server /data --console-address ":9001"
