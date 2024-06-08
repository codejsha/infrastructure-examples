######################################################################

function docker_run_mysql8() {
    docker container run \
        --detach \
        --name mysql8 \
        --publish 3306:3306 \
        --env MYSQL_ROOT_PASSWORD="test" \
        --env TZ="Asia/Seoul" \
        mysql:8
}
docker_run_mysql8

######################################################################

function docker_run_mysql8_volume() {
    docker container run \
        --detach \
        --name mysql8 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="test" \
        --env TZ="Asia/Seoul" \
        --mount type="volume",src="mysql_data",dst="/var/lib/mysql" \
        --mount type="volume",src="mysql_config",dst="/etc/mysql/conf.d" \
        mysql:8
}
docker_run_mysql8_volume

######################################################################

function docker_run_mysql8_bind() {
    local MYSQL_VOLUME_DIR="/mnt/volume/mysql"
    mkdir -p ${MYSQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name mysql8 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="test" \
        --env TZ="Asia/Seoul" \
        --mount type="bind",src="${MYSQL_VOLUME_DIR}/data",dst="/var/lib/mysql" \
        mysql:8
}
docker_run_mysql8_bind

######################################################################

function docker_run_mysql5() {
    docker container run \
        --detach \
        --name mysql5 \
        --publish 3306:3306 \
        --env MYSQL_ROOT_PASSWORD="test" \
        --env TZ="Asia/Seoul" \
        --mount type="bind",src="${MYSQL_VOLUME_DIR}/data",dst="/var/lib/mysql" \
        mysql:5
}
docker_run_mysql5

######################################################################

function docker_run_mysql5_bind() {
    local MYSQL_VOLUME_DIR="/mnt/volume/mysql"
    mkdir -p ${MYSQL_VOLUME_DIR}/data

    docker container run \
        --detach \
        --name mysql5 \
        --publish 3306:3306 \
        --publish 33060:33060 \
        --env MYSQL_ROOT_PASSWORD="test" \
        --env TZ="Asia/Seoul" \
        --mount type="bind",src="${MYSQL_VOLUME_DIR}/data",dst="/var/lib/mysql" \
        mysql:5
}
docker_run_mysql5_bind
