######################################################################

function docker_run_ubuntu_23_04() {
    docker container run \
        -it \
        --name ubuntu \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        ubuntu:23.04
}
docker_run_ubuntu_23_04

function docker_run_ubuntu_22_04() {
    docker container run \
        -it \
        --name ubuntu \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        ubuntu:22.04
}
docker_run_ubuntu_22_04

function docker_run_ubuntu_20_04() {
    docker container run \
        -it \
        --name ubuntu \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        ubuntu:20.04
}
docker_run_ubuntu_20_04
