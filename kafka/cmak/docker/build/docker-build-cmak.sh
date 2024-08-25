#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

docker image build --tag harbor.example.com/library/cmak:3.0.0.6 .

# docker image push harbor.example.com/library/cmak:3.0.0.6
