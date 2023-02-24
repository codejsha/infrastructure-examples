#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="vault"
WORKDIR="./helm/tls"

######################################################################
### standalone mode
######################################################################

# mkdir -p ${HOME}/.vault
# kubectl exec -it --namespace ${NAMESPACE} my-vault-0 -- vault operator init -format="json" > ${HOME}/.vault/init-keys.json
# VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${HOME}/.vault/init-keys.json)
# cat ${HOME}/.vault/init-keys.json | jq -r ".root_token" > ${HOME}/.vault/root_token.txt
# kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator unseal $(echo $VAULT_UNSEAL_KEY | awk '{print $1;}')
# kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator unseal $(echo $VAULT_UNSEAL_KEY | awk '{print $2;}')
# kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator unseal $(echo $VAULT_UNSEAL_KEY | awk '{print $3;}')

######################################################################
### ha mode
######################################################################

### initialize the vault and unseal it

mkdir -p ${HOME}/.vault
kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator init \
    -key-shares=1 \
    -key-threshold=1 \
    -format=json > ${WORKDIR}/cluster-keys.json
VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${WORKDIR}/cluster-keys.json)
kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator unseal ${VAULT_UNSEAL_KEY}

CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
echo ${CLUSTER_ROOT_TOKEN} > ${HOME}/.vault/root_token.txt

### join other pods to the raft cluster

# kubectl exec -n ${NAMESPACE} -it my-vault-1 -- vault operator raft join -address=https://my-vault-1.vault-internal:8200 -leader-ca-cert="$(cat /vault/userconfig/vault-ha-tls/kubernetes-ca.crt)" -leader-client-cert="$(cat /vault/userconfig/vault-ha-tls/vault.crt)" -leader-client-key="$(cat /vault/userconfig/vault-ha-tls/vault.key)" https://my-vault-0.vault-internal:8200
# kubectl exec -n ${NAMESPACE} -ti my-vault-1 -- vault operator unseal ${VAULT_UNSEAL_KEY}
# kubectl exec -n ${NAMESPACE} -it my-vault-2 -- vault operator raft join -address=https://my-vault-2.vault-internal:8200 -leader-ca-cert="$(cat /vault/userconfig/vault-ha-tls/kubernetes-ca.crt)" -leader-client-cert="$(cat /vault/userconfig/vault-ha-tls/vault.crt)" -leader-client-key="$(cat /vault/userconfig/vault-ha-tls/vault.key)" https://my-vault-0.vault-internal:8200
# kubectl exec -n ${NAMESPACE} -ti my-vault-2 -- vault operator unseal ${VAULT_UNSEAL_KEY}

### export cluster root token
export CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
kubectl exec -n ${NAMESPACE} my-vault-0 -- vault login ${CLUSTER_ROOT_TOKEN}
### list the raft peers
kubectl exec -n ${NAMESPACE} my-vault-0 -- vault operator raft list-peers
### print ha status
kubectl exec -n ${NAMESPACE} my-vault-0 -- vault status

mv ${WORKDIR}/cluster-keys.json ${HOME}/.vault/cluster-keys.json
