######################################################################

function docker_run_sftp_server_volume() {
    USERNAME="user"
    PASSWORD="${PASSWORD}"

    SFTP_SERVER_VOLUME_DIR="/mnt/volume/ftp/pub"
    docker create volume sftp-data

    docker run --rm \
        --mount type="volume",src="sftp-data",dst="/data" \
        -v ${SFTP_SERVER_VOLUME_DIR}:/backup \
        alpine:latest \
        sh -c "cp -r /backup/* /data/; chown -R 1000 /data"

    docker container run \
        --detach \
        --name sftp-server \
        --publish 2222:22 \
        --mount type="volume",src="sftp-data",dst="/home/${USERNAME}/share" \
        atmoz/sftp \
        ${USERNAME}:${PASSWORD}:1000
}
docker_run_sftp_server_volume

######################################################################

function docker_run_sftp_server_pub() {
    USERNAME="user"
    PASSWORD="${PASSWORD}"

    SFTP_SERVER_VOLUME_DIR="/mnt/volume/ftp/pub"
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

######################################################################

function docker_run_sftp_server_share() {
    USERNAME="user"
    PASSWORD="${PASSWORD}"

    docker container run \
        --detach \
        --name sftp-server \
        --publish 2222:22 \
        --mount type="bind",src="/mnt/share",dst="/home/${USERNAME}/share" \
        atmoz/sftp \
        ${USERNAME}:${PASSWORD}:1000
}
docker_run_sftp_server_share
