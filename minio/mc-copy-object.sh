#!/usr/bin/bash

MINIO_ALIAS="myminio"
SOURCE="${1}"
TARGET="${2}"

if [ -n "${SOURCE}" ] && [ -n "${TARGET}" ]; then
    mc cp ${SOURCE} ${MINIO_ALIAS}/${TARGET}
else
    printf "\x1b[38;2;216;80;80musage:  mc-copy-object SOURCE TARGET\x1b[0m\n"
fi
