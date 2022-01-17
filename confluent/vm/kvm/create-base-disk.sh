#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

DISK_DIR="/mnt/disk"

qemu-img create -f qcow2 ${DISK_DIR}/cp1-base.qcow2 256G
