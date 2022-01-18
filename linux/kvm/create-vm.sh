#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

virt-install \
    --name centos \
    --vcpus 2 \
    --memory 2048 \
    --os-type=Linux \
    --os-variant centos8 \
    --network network=default \
    --location /path/to/centos8.iso \
    --disk path=/tmp/winxp.img,size=6 \
    --extra-args "console=tty0 console=ttyS0,115200n8"
