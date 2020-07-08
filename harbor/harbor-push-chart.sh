#!/usr/bin/bash

# usage:
# bash harbor-push-helm.sh <CHART_PATH> [TAG]

CHART_PATH="${1}"
TAG="${2:-latest}"

HARBOR_URL="core.harbor.kube.example.com"
PROJECT="myproject"
REPOSITORY="myrepo"

if [ -z "${CHART_PATH}" ]; then
    echo "ERROR: The CHART_PATH argument is required!"
    exit
fi

helm chart save ${CHART_PATH} ${HARBOR_URL}/${PROJECT}/${REPOSITORY}:${TAG}
helm chart push ${HARBOR_URL}/${PROJECT}/${REPOSITORY}:${TAG}
