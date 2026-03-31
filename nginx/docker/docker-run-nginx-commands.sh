######################################################################

function docker_run_nginx_volume() {
    docker volume create nginx-conf
    docker volume create nginx-cert
    docker volume create nginx-htdocs
    docker volume create nginx-logs

    docker run --rm \
        -v "${NGINX_VOLUME_DIR}/nginx.conf":/src/nginx.conf:ro \
        -v nginx-conf:/dst \
        alpine cp /src/nginx.conf /dst/nginx.conf
    docker run --rm \
        -v "${NGINX_VOLUME_DIR}/conf.d":/src:ro \
        -v nginx-conf:/dst/conf.d \
        alpine cp -r /src/. /dst/conf.d/
    docker run --rm \
        -v "${NGINX_VOLUME_DIR}/cert":/src:ro \
        -v nginx-cert:/dst \
        alpine cp -r /src/. /dst/
    docker run --rm \
        -v "${NGINX_VOLUME_DIR}/htdocs":/src:ro \
        -v nginx-htdocs:/dst \
        alpine cp -r /src/. /dst/

    docker container run \
        --detach \
        --name nginx \
        --restart unless-stopped \
        --publish 8080:80 \
        --mount type=volume,source=nginx-conf,target=/etc/nginx \
        --mount type=volume,source=nginx-cert,target=/etc/nginx/cert \
        --mount type=volume,source=nginx-htdocs,target=/usr/share/nginx/html \
        --mount type=volume,source=nginx-logs,target=/var/log/nginx \
        --mount type=bind,source=/mnt/share,target=/mnt/share,readonly \
        nginx:latest
}
docker_run_nginx_volume

######################################################################

function docker_run_nginx_bind() {
    NGINX_VOLUME_DIR="/mnt/volume/nginx"
    sudo mkdir -p ${NGINX_VOLUME_DIR}/{cert,conf.d,htdocs,logs}
    # sudo /bin/cp -f nginx.conf ${NGINX_VOLUME_DIR}/nginx.conf
    # sudo /bin/cp -f reverse-proxy.conf ${NGINX_VOLUME_DIR}/conf.d/reverse-proxy.conf

    docker container run \
        --detach \
        --name nginx \
        --publish 8080:80 \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/nginx.conf",target="/etc/nginx/nginx.conf" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/cert",target="/etc/nginx/cert" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/conf.d",target="/etc/nginx/conf.d" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/htdocs",target="/usr/share/nginx/html" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/logs",target="/var/log/nginx" \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        nginx:latest
}
docker_run_nginx_bind

######################################################################

function docker_run_nginx_with_network() {
    NETWORK="platform-network"
    NGINX_VOLUME_DIR="/mnt/volume/nginx"
    sudo mkdir -p ${NGINX_VOLUME_DIR}/{cert,conf.d,htdocs,logs}
    # sudo /bin/cp -f nginx.conf ${NGINX_VOLUME_DIR}/nginx.conf
    # sudo /bin/cp -f reverse-proxy.conf ${NGINX_VOLUME_DIR}/conf.d/reverse-proxy.conf

    docker container run \
        --detach \
        --name nginx \
        --restart unless-stopped \
        --network ${NETWORK} \
        --publish 80:80 \
        --publish 443:443 \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/nginx.conf",target="/etc/nginx/nginx.conf" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/cert",target="/etc/nginx/cert" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/conf.d",target="/etc/nginx/conf.d" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/htdocs",target="/usr/share/nginx/html" \
        --mount type="bind",source="${NGINX_VOLUME_DIR}/logs",target="/var/log/nginx" \
        nginx:latest
}
docker_run_nginx_with_network
