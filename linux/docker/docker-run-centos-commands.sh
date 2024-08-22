######################################################################

function docker_run_centos() {
    docker container run \
        -it \
        --name centos \
        centos:latest
}
docker_run_centos

function docker_run_centos7() {
    docker container run \
        -it \
        --name centos7 \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        centos:7
}
docker_run_centos7

function docker_run_centos6() {
    docker container run \
        -it \
        --name centos6 \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        centos:6
}
docker_run_centos6
