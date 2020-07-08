#!/usr/bin/bash

RELEASE_NAME="${1}"

helm status ${RELEASE_NAME}
