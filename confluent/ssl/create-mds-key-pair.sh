#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace
set -o xtrace

openssl genrsa -out tokenKeypair.pem 2048
openssl rsa -in tokenKeypair.pem -outform PEM -pubout -out public.pem

### move files
mkdir -p ssl
mv tokenKeypair.pem public.pem ssl/
