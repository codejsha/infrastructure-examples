#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function docker_run_httpd {
    HTTPD_VOLUME_DIR="/mnt/volume/httpd"
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

function docker_run_httpd_specific_network {
    HTTPD_VOLUME_DIR="/mnt/volume/httpd"
    sudo mkdir -p ${HTTPD_VOLUME_DIR}/{conf,htdocs,logs}

    docker container run \
        --detach \
        --name httpd \
        --network minikube \
        --publish 80:80 \
        --publish 443:443 \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/conf",target="/usr/local/apache2/conf" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/htdocs",target="/usr/local/apache2/htdocs" \
        --mount type="bind",source="${HTTPD_VOLUME_DIR}/logs",target="/usr/local/apache2/logs" \
        httpd:2.4
}

######################################################################

docker_run_httpd
# docker_run_httpd_specific_network
