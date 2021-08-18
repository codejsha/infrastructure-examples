#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### requirements
###
### htpasswd:
### sudo yum install -y httpd-tools
### sudo apt-get install -y apache2 apache2-utils
###
### bucket:
### mc mb --insecure minio-tenant-1/harbor-storage
### mc mb my-minio/harbor-storage

# helm repo add harbor https://helm.goharbor.io
# helm repo update

PASSWORD="${PASSWORD}"
HARBOR_SECRET_KEY="${HARBOR_SECRET_KEY}"

### image and chart storage
### s3
export AWS_S3_REGION_ENDPOINT="https://minio-tenant-1.example.com"
# export AWS_S3_REGION_ENDPOINT="http://minio.example.com"
export AWS_ACCESS_KEY="minio"
export AWS_SECRET_KEY="minio123"

export HARBOR_ADMIN_PASSWORD="${PASSWORD}"
export HARBOR_SECRET_KEY="${HARBOR_SECRET_KEY}" # Must be a string of 16 chars
export REGISTRY_USERNAME="admin"
export REGISTRY_PASSWORD="${PASSWORD}"
export REGISTRY_HTPASSWD="$(htpasswd -nbBC10 ${REGISTRY_USERNAME} ${REGISTRY_PASSWORD})"
export DATABASE_PASSWORD="${PASSWORD}"

envsubst < ./values.yaml > ./values-temp.yaml

NAMESPACE="harbor-system"

### official harbor
# helm install my-harbor \
helm upgrade --install my-harbor \
    --create-namespace \
    --namespace ${NAMESPACE} \
    --values values-temp.yaml \
    --version 1.7.1 \
    harbor/harbor
