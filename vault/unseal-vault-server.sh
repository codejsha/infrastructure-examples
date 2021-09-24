#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault-system"
# VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

UNSEAL_KEY1="$(cat ~/.vault/init-keys.json | jq -r ".unseal_keys_b64[0]")"
UNSEAL_KEY2="$(cat ~/.vault/init-keys.json | jq -r ".unseal_keys_b64[1]")"
UNSEAL_KEY3="$(cat ~/.vault/init-keys.json | jq -r ".unseal_keys_b64[2]")"
UNSEAL_KEY4="$(cat ~/.vault/init-keys.json | jq -r ".unseal_keys_b64[3]")"
UNSEAL_KEY5="$(cat ~/.vault/init-keys.json | jq -r ".unseal_keys_b64[4]")"

echo "### unseal_keys_b64"
echo ${UNSEAL_KEY1}
echo ${UNSEAL_KEY2}
echo ${UNSEAL_KEY3}
echo ${UNSEAL_KEY4}
echo ${UNSEAL_KEY5}
echo

kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY1}
echo
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY2}
echo
kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY3}
echo
# kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY4}
# echo
# kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator unseal ${UNSEAL_KEY5}
# echo
