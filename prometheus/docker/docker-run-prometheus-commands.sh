######################################################################

function docker_run_prometheus() {
    local PROMETHEUS_VOLUME_DIR="/mnt/volume/prometheus"
    sudo mkdir -p ${PROMETHEUS_VOLUME_DIR}
    sudo /bin/cp -f prometheus.yml ${PROMETHEUS_VOLUME_DIR}/prometheus.yml

    docker container run \
        --detach \
        --name prometheus \
        --publish 9090:9090 \
        --mount type="bind",src="${PROMETHEUS_VOLUME_DIR}",dst="/etc/prometheus" \
        prom/prometheus
}
docker_run_prometheus
