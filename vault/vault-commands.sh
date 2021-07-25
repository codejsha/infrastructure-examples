######################################################################

export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"
export VAULT_ADDR="http://vault.example.com"
export VAULT_ADDR="http://localhost:8200"

######################################################################

### unseal vault server

mkdir -p ~/.vault
kubectl exec -it my-vault-0 -- vault operator init > ~/.vault/unseal_keys_and_root_token.txt
cat ~/.vault/unseal_keys_and_root_token.txt

# kubectl exec -it my-vault-0 -- vault operator unseal
kubectl exec -it my-vault-0 -- vault operator unseal <UNSEAL_KEY_1>
kubectl exec -it my-vault-0 -- vault operator unseal <UNSEAL_KEY_2>
kubectl exec -it my-vault-0 -- vault operator unseal <UNSEAL_KEY_3>

######################################################################

### connect to running container

### default namespace
NAMESPACE="default"

### vault namespace
NAMESPACE="vault-system"

VAULT_PODNAME="$(kubectl get pods --namespace ${NAMESPACE} --selector app.kubernetes.io/name=vault --output custom-columns=:metadata.name)"
kubectl exec -it --namespace ${NAMESPACE} ${VAULT_PODNAME} --container vault -- /bin/sh
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

######################################################################

vault operator rekey

######################################################################

### enable kubernetes authentication method
vault auth enable kubernetes

vault write auth/kubernetes/config \
    token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
    kubernetes_host="https://10.10.10.11:6443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
vault write auth/kubernetes/config \
    token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
    kubernetes_host="https://192.168.140.11:6443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

######################################################################

### kv

vault secrets enable -path=infra kv-v2
vault secrets enable -path=internal kv-v2

######################################################################

### pki

vault secrets enable pki
vault secrets tune -max-lease-ttl=87600h pki
