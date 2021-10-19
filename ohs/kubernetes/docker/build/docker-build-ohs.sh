#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

bash ./buildDockerImage.sh -s -v 12.2.1.4.0
# docker build -f 12.2.1.4.0/Dockerfile -t oracle/jdk:12.2.1.4.0
