######################################################################

function docker_run_portainer() {
    local PORTAINER_VOLUME_DIR="/mnt/volume/portainer"
    sudo mkdir -p ${PORTAINER_VOLUME_DIR}/data

    docker container run \
        --detach \
        --restart unless-stopped \
        --name portainer \
        --publish 8000:8000 \
        --publish 9000:9000 \
        --mount type="bind",src="/var/run/docker.sock",dst="/var/run/docker.sock" \
        --mount type="bind",src="${PORTAINER_VOLUME_DIR}/data",dst="/data" \
        portainer/portainer
}
docker_run_portainer
