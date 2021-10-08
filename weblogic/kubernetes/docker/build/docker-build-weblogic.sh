#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# SHARE_DIR="/mnt/share"
SHARE_DIR="/mnt/f/share"

### clone repository
if [ ! -d "./docker-images" ]; then
    git clone https://github.com/oracle/docker-images.git
    # gh repo clone oracle/docker-images
fi

cd docker-images/OracleWebLogic/dockerfiles

######################################################################

function docker_image_build_wls12214 {
    /bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls12.2.1.4/fmw_12.2.1.4.0_wls_lite_Disk1_1of1.zip 12.2.1.4
    bash buildDockerImage.sh -v 12.2.1.4 -g
    rm -f 12.2.1.4/*.zip
}

function docker_image_build_wls1411 {
    /bin/cp -f ${SHARE_DIR}/oracle-weblogic-server/wls14.1.1/fmw_14.1.1.0.0_wls_lite_Disk1_1of1.zip 14.1.1.0
    bash buildDockerImage.sh -v 14.1.1.0 -g
    rm -f 14.1.1.0/*.zip
}

######################################################################

docker_image_build_wls12214
docker_image_build_wls1411
