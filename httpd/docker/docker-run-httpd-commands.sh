######################################################################

function docker_run_httpd() {
    local HTTPD_VOLUME_DIR="/mnt/volume/httpd"
    sudo mkdir -p ${HTTPD_VOLUME_DIR}/{conf,htdocs,logs}
    # sudo /bin/cp -f docker-httpd.conf ${HTTPD_VOLUME_DIR}/conf/httpd.conf

    docker container run \
        --detach \
        --name httpd \
        --publish 8080:80 \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/conf",target="/usr/local/apache2/conf" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/htdocs",target="/usr/local/apache2/htdocs" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/logs",target="/usr/local/apache2/logs" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        httpd:2.4
}
docker_run_httpd

function docker_run_httpd_with_network() {
    local NETWORK="minikube"
    local HTTPD_VOLUME_DIR="/mnt/volume/httpd"
    sudo mkdir -p ${HTTPD_VOLUME_DIR}/{conf,htdocs,logs}

    docker container run \
        --detach \
        --name httpd \
        --network "${NETWORK}" \
        --publish 80:80 \
        --publish 443:443 \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/conf",target="/usr/local/apache2/conf" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/htdocs",target="/usr/local/apache2/htdocs" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/logs",target="/usr/local/apache2/logs" \
        httpd:2.4
}
docker_run_httpd_with_network
