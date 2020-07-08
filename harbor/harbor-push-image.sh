#!/usr/bin/bash

# usage:
# bash harbor-push-image.sh <SOURCE_IMAGE> [TAG]

SOURCE_IMAGE="${1}"
TAG="${2:-latest}"

HARBOR_URL="core.harbor.kube.example.com"
PROJECT="myproject"
REPOSITORY="myrepo"

if [ -z "${SOURCE_IMAGE}" ]; then
    echo "ERROR: The SOURCE_IMAGE argument is required!"
    exit
fi

docker tag ${SOURCE_IMAGE}:${TAG} ${HARBOR_URL}/${PROJECT}/${REPOSITORY}:${TAG}
docker push ${HARBOR_URL}/${PROJECT}/${REPOSITORY}:${TAG}
