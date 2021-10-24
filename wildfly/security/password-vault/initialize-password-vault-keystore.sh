#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh
source ./env-password-vault-keystore.sh

if [ ! -f "${JBOSS_HOME}/vault/vault.keystore" ]; then
    keytool \
        -genseckey \
        -alias vault \
        -storetype jceks \
        -deststoretype pkcs12 \
        -keyalg AES \
        -keysize 128 \
        -storepass ${KEYSTORE_PASSWORD} \
        -keypass ${KEYSTORE_PASSWORD} \
        -validity 36500 \
        -keystore ${JBOSS_HOME}/vault/vault.keystore
    echo "[INFO] The keystore has been created."
else
    echo "[ERROR] The keystore is already exists!"
fi
