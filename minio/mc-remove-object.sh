#!/usr/bin/bash

MINIO_ALIAS="myminio"
TARGET="${1}"

if [ -n "${TARGET}" ]; then
    mc rm --recursive --force ${MINIO_ALIAS}/${TARGET}
else
    printf "\x1b[38;2;216;80;80musage:  mc-remove-object TARGET\x1b[0m\n"
fi
