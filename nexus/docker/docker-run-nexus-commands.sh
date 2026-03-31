######################################################################

function docker_run_nexus_volume() {
    docker create volume nexus-data

    docker container run \
        --detach \
        --name nexus \
        --publish 8081:8081 \
        --mount type="volume",src="nexus-data",dst="/nexus-data" \
        sonatype/nexus3
}
docker_run_nexus_volume

######################################################################

function docker_run_nexus_bind() {
    NEXUS_VOLUME_DIR="/mnt/volume/nexus"
    sudo mkdir -p ${NEXUS_VOLUME_DIR}

    docker container run \
        --detach \
        --name nexus \
        --publish 8081:8081 \
        --mount type="bind",src="${NEXUS_VOLUME_DIR}",dst="/nexus-data" \
        sonatype/nexus3
}
docker_run_nexus_bind
