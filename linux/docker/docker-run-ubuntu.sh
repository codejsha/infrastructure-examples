#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

######################################################################

function docker_run_ubuntu {
    docker container run \
        -it \
        --name ubuntu \
        --mount type="bind",src="/mnt/share",dst="/mnt/share",readonly \
        ubuntu:20.04
}

######################################################################

docker_run_ubuntu
