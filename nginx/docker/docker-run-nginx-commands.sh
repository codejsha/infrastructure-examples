######################################################################

function docker_run_nginx() {
    local NGINX_VOLUME_DIR="/mnt/volume/nginx"
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
docker_run_nginx

function docker_run_nginx_with_network() {
    local NETWORK="minikube"
    local NGINX_VOLUME_DIR="/mnt/volume/nginx"
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
