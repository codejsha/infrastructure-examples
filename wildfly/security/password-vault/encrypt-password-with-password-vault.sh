#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

source ../../env-base.sh
source ./env-password-vault-keystore.sh
source ./env-password-vault.sh

### vault.sh parameters:
### --keystore KEYSTORE_URL
### --keystore-password KEYSTORE_PASSWORD
### --salt SALT
### --alias KEYSTORE_ALIAS
### --iteration ITERATION_COUNT
### --enc-dir ENC_FILE_DIR (Directory to store encrypted files)
### --vault-block VAULT_BLOCK
### --attribute ATTRIBUTE
### --sec-attr SEC-ATTR
bash ${JBOSS_HOME}/bin/vault.sh \
    --keystore ${JBOSS_HOME}/vault-store/vault.keystore \
    --keystore-password ${KEYSTORE_PASSWORD} \
    --salt ${VAULT_SALT} \
    --alias vault \
    --iteration 120 \
    --enc-dir ${JBOSS_HOME}/vault-store/ \
    --vault-block ${VAULT_BLOCK} \
    --attribute ${VAULT_ATTRIBUTE} \
    --sec-attr ${PLAINTEXT_PASSWORD}

### Result format
### ${VAULT::VAULT_BLOCK::ATTRIBUTE_NAME::MASKED_STRING}

### Run vault configuration commands in CLI (jboss-cli)
### For standalone mode: // ...
### For domain mode: // ...
