#!/usr/bin/bash

MINIO_ALIAS="myminio"
BUCKET="${1}"

if [ -n "${BUCKET}" ]; then
    mc rb ${MINIO_ALIAS}/${BUCKET}
    # mc rb --force ${MINIO_ALIAS}/${BUCKET}
else
    printf "\x1b[38;2;216;80;80musage:  mc-remove-bucket BUCKET\x1b[0m\n"
fi
