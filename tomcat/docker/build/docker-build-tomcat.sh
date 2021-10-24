#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# docker image build --tag tomcat-starter:9 .
# docker image tag tomcat-starter:9 harbor.example.com/library/tomcat-starter:9
# docker image push harbor.example.com/library/tomcat-starter:9

# docker image build --file Dockerfile.dev --tag tomcat-starter:9-dev .
# docker image tag tomcat-starter:9-dev harbor.example.com/library/tomcat-starter:9-dev
# docker image push harbor.example.com/library/tomcat-starter:9-dev

docker image build --file Dockerfile.dev --tag tomcat-starter:latest .
docker image tag tomcat-starter:latest harbor.example.com/library/tomcat-starter:latest
docker image push harbor.example.com/library/tomcat-starter:latest
