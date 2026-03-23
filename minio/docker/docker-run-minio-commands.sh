######################################################################

function docker_run_minio_volume() {
    USERNAME="minio"
    PASSWORD="minio123"

    docker create volume minio-data

    docker container run \
        --detach \
        --name minio \
        --publish 9000:9000 \
        --publish 9001:9001 \
        --env MINIO_ROOT_USER="${USERNAME}" \
        --env MINIO_ROOT_PASSWORD="${PASSWORD}" \
        --mount type="volume",src="minio-data",dst="/data" \
        minio/minio server /data --console-address ":9001"
}
docker_run_minio_volume

######################################################################

function docker_run_minio_bind() {
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
}
docker_run_minio_bind()
