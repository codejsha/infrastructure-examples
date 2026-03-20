######################################################################

function docker_run_coredns() {
    local COREDNS_VOLUME_DIR="/mnt/volume/coredns"
    sudo mkdir -p ${COREDNS_VOLUME_DIR}
    sudo /bin/cp -f corefile-server.conf ${COREDNS_VOLUME_DIR}/Corefile

    docker container run \
        --detach \
        --name coredns \
        --restart unless-stopped \
        --publish 53:53/udp \
        --mount type="bind",src="${COREDNS_VOLUME_DIR}",dst="/root/coredns" \
        coredns/coredns:latest \
        -conf /root/coredns/Corefile
}
docker_run_coredns

function podman_run_coredns() {
    local COREDNS_VOLUME_DIR="/mnt/volume/coredns"
    sudo mkdir -p ${COREDNS_VOLUME_DIR}
    sudo /bin/cp -f corefile-server.conf ${COREDNS_VOLUME_DIR}/Corefile

    sudo podman container run \
        --detach \
        --name coredns \
        --restart unless-stopped \
        --publish 53:53/udp \
        --mount type="bind",src="${COREDNS_VOLUME_DIR}",dst="/root/coredns" \
        coredns/coredns:latest \
        -conf /root/coredns/Corefile
}
podman_run_coredns
