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

### oracle/serverjre:8-oraclelinux8
function docker_image_build_jre8_oraclelinux8() {
    cd 8
    /bin/cp -f ${SHARE_DIR}/oracle-jdk/8/server-jre-8u301-linux-x64.tar.gz .
    # /bin/cp -f ${SCRIPT_DIR}/Dockerfile.jdk8 Dockerfile.8
    bash ./build.sh 8
    rm -f *.tar.gz

    # /bin/cp -f ${SHARE_DIR}/oracle-jdk/8/server-jre-8u301-linux-x64.tar.gz .
    # docker build -f Dockerfile.jdk8 -t oracle/jdk:8-oraclelinux8 .
    # rm -f *.tar.gz
}

######################################################################

docker_image_build_jre8_oraclelinux8
