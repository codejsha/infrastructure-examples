######################################################################

function docker_run_httpd_volume() {
    docker volume create httpd-conf
    docker volume create httpd-htdocs
    docker volume create httpd-logs

    docker container run \
        --detach \
        --name httpd \
        --publish 8080:80 \
        --mount type="volume",src="httpd-conf",dst="/usr/local/apache2/conf" \
        --mount type="volume",src="httpd-htdocs",dst="/usr/local/apache2/htdocs" \
        --mount type="volume",src="httpd-logs",dst="/usr/local/apache2/logs" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        httpd:2.4
}
docker_run_httpd_volume

######################################################################

function docker_run_httpd() {
    HTTPD_VOLUME_DIR="/mnt/volume/httpd"
    sudo mkdir -p ${HTTPD_VOLUME_DIR}/{conf,htdocs,logs}
    # sudo /bin/cp -f docker-httpd.conf ${HTTPD_VOLUME_DIR}/conf/httpd.conf

    docker container run \
        --detach \
        --name httpd \
        --publish 8080:80 \
        --mount type="bind",src="${HTTPD_VOLUME_DIR}/conf",dst="/usr/local/apache2/conf" \
        --mount type="bind",src="${HTTPD_VOLUME_DIR}/htdocs",dst="/usr/local/apache2/htdocs" \
        --mount type="bind",src="${HTTPD_VOLUME_DIR}/logs",dst="/usr/local/apache2/logs" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        httpd:2.4
}
docker_run_httpd
