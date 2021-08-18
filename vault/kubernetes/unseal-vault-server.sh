#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault-system"
# VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

UNSEAL_KEY_LINE1="$(grep -E "Unseal Key 1: " ~/.vault/unseal_keys_and_root_token.txt)"
UNSEAL_KEY_LINE2="$(grep -E "Unseal Key 2: " ~/.vault/unseal_keys_and_root_token.txt)"
UNSEAL_KEY_LINE3="$(grep -E "Unseal Key 3: " ~/.vault/unseal_keys_and_root_token.txt)"
UNSEAL_KEY_LINE4="$(grep -E "Unseal Key 4: " ~/.vault/unseal_keys_and_root_token.txt)"
UNSEAL_KEY_LINE5="$(grep -E "Unseal Key 5: " ~/.vault/unseal_keys_and_root_token.txt)"

UNSEAL_KEY1="$(echo ${UNSEAL_KEY_LINE1} | perl -p -e "s/Unseal Key 1: //")"
UNSEAL_KEY2="$(echo ${UNSEAL_KEY_LINE2} | perl -p -e "s/Unseal Key 2: //")"
UNSEAL_KEY3="$(echo ${UNSEAL_KEY_LINE3} | perl -p -e "s/Unseal Key 3: //")"
UNSEAL_KEY4="$(echo ${UNSEAL_KEY_LINE4} | perl -p -e "s/Unseal Key 4: //")"
UNSEAL_KEY5="$(echo ${UNSEAL_KEY_LINE5} | perl -p -e "s/Unseal Key 5: //")"

echo ${UNSEAL_KEY1}
echo ${UNSEAL_KEY2}
echo ${UNSEAL_KEY3}
echo ${UNSEAL_KEY4}
echo ${UNSEAL_KEY5}

kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY1}
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY2}
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY3}
# kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY4}
# kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY5}
