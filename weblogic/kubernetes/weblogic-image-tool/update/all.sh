#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

bash ./build-archive.sh
bash ./imagetool-update-build-weblogic.sh

cd docker/build-wldf
bash ./docker-build-wldf.sh
cd ../../

bash ./docker-push-image.sh
bash ./deploy-domain.sh
