######################################################################

function docker_run_sftp_server_share() {
    local USERNAME="user"
    local PASSWORD="${PASSWORD}"

    docker container run \
        --detach \
        --name sftp-server \
        --publish 2222:22 \
        --mount type="bind",src="/mnt/share",dst="/home/${USERNAME}/share" \
        atmoz/sftp \
        ${USERNAME}:${PASSWORD}:1000
}
docker_run_sftp_server_share

function docker_run_sftp_server_pub() {
    local USERNAME="user"
    local PASSWORD="${PASSWORD}"

    local SFTP_SERVER_VOLUME_DIR="/mnt/volume/ftp/pub"
    sudo mkdir -p ${SFTP_SERVER_VOLUME_DIR}
    # sudo mkdir -p ${SFTP_SERVER_VOLUME_DIR}/{data,error,finished}
    # sudo chown -R 1000 ${SFTP_SERVER_VOLUME_DIR}

    docker container run \
        --detach \
        --name sftp-server \
        --publish 2222:22 \
        --mount type="bind",src="${SFTP_SERVER_VOLUME_DIR}",dst="/home/${USERNAME}/pub" \
        atmoz/sftp \
        ${USERNAME}:${PASSWORD}:1000
}
docker_run_sftp_server_pub
