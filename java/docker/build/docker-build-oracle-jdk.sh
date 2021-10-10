#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

SHARE_DIR="/mnt/share"
SCRIPT_DIR="$( cd "$( dirname $0 )" && pwd )"

## clone repository
if [ ! -d "./docker-images" ]; then
    git clone https://github.com/oracle/docker-images.git
    # gh repo clone oracle/docker-images
fi

cd docker-images/OracleJava

######################################################################

function docker_image_build_11_oraclelinux8 {
    cd 11
    /bin/cp -f ${SHARE_DIR}/oracle-jdk/11/jdk-11.0.12_linux-x64_bin.tar.gz .
    /bin/cp -f ${SCRIPT_DIR}/Dockerfile.jdk11 .
    bash ./build.sh 8
    rm -f *.tar.gz

    # /bin/cp -f ${SHARE_DIR}/oracle-jdk/11/jdk-11.0.12_linux-x64_bin.tar.gz .
    # docker build -f Dockerfile.jdk11 -t oracle/jdk:11-oraclelinux8 .
    # rm -f *.tar.gz
}

######################################################################

docker_image_build_11_oraclelinux8
