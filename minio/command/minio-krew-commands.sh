######################################################################

### krew

kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 1 \
    --volumes 4 \
    --capacity 4Ti \
    --storage-class ${STORAGE_CLASS}
kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 3 \
    --volumes 12 \
    --capacity 12Ti \
    --storage-class ${STORAGE_CLASS}

######################################################################

### krew (dry run)

kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 1 \
    --volumes 4 \
    --capacity 4Ti \
    --storage-class ${STORAGE_CLASS} \
    --output > tenant.yaml
kubectl minio tenant create \
    ${TENANT_NAME} \
    --namespace ${NAMESPACE} \
    --servers 3 \
    --volumes 12 \
    --capacity 12Ti \
    --storage-class ${STORAGE_CLASS} \
    --output > tenant.yaml
