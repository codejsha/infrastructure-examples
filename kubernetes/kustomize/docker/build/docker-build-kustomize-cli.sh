#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# docker image build --tag registry.example.com/kustomize-cli:latest .
# docker image push registry.example.com/kustomize-cli:latest

docker image build --tag harbor.example.com/library/kustomize-cli:latest .
docker image push harbor.example.com/library/kustomize-cli:latest
