######################################################################

function docker_run_chartmuseum_with_local_storage() {
    local CHARTMUSEUM_VOLUME_DIR="/mnt/volume/chartmuseum"
    sudo mkdir -p ${CHARTMUSEUM_VOLUME_DIR}

    docker container run \
        --rm \
        --detach \
        --name chartmuseum \
        --publish 8080:8080 \
        --env DEBUG="true" \
        --env STORAGE="local" \
        --env STORAGE_LOCAL_ROOTDIR="/charts" \
        --mount type="bind",src="${CHARTMUSEUM_VOLUME_DIR}",dst="/charts" \
        chartmuseum/chartmuseum:latest
}
docker_run_chartmuseum_with_local_storage

function docker_run_chartmuseum_with_s3_storage() {
    # mc mb my-minio/chart-storage

    docker container run \
        --rm \
        --detach \
        --name chartmuseum \
        --publish 8080:8080 \
        --env DEBUG=1 \
        --env STORAGE="amazon" \
        --env STORAGE_AMAZON_BUCKET="chart-storage" \
        --env STORAGE_AMAZON_PREFIX="" \
        --env STORAGE_AMAZON_REGION="us-west-1" \
        --mount type="bind",src="~/.aws",dst="/home/chartmuseum/.aws",readonly \
        chartmuseum/chartmuseum:latest
}
docker_run_chartmuseum_with_s3_storage
