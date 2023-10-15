#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

# KAFKA_DOCKER_NETWORK="stream-network"

INSTALL_SCRIPT_DIR="/svc/infrastructure/confluent/docker-compose"

docker-compose --file ${INSTALL_SCRIPT_DIR}/docker-compose.yaml stop
# docker-compose --file ${INSTALL_SCRIPT_DIR}/docker-compose.yaml down

# docker network rm ${KAFKA_DOCKER_NETWORK}
