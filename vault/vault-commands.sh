######################################################################

export VAULT_ADDR="http://vault.example.com"
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="$(cat ~/.vault/root_token.txt)"

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
    kubernetes_host="https://kubernetes.docker.internal:6443" \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
    issuer="https://kubernetes.default.svc.cluster.local"
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

vault secrets enable -path=internal kv-v2

######################################################################

### pki

vault secrets enable pki
vault secrets tune -max-lease-ttl="87600h" pki

### read ca certificate
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' |  openssl x509 -text -noout
vault read pki/cert/ca -format="json" | jq -r '.data.certificate' > ca.crt
curl -s http://vault.example.com/v1/pki/ca/pem | openssl x509 -text -noout

### certificate list
vault list pki/certs
curl \
    --header "X-Vault-Token:${VAULT_TOKEN}" \
    --request LIST \
    http://vault.example.com/v1/pki/certs

### get certificate
vault read pki/cert/${SERIAL} -format="json" | jq -r '.data.certificate' |  openssl x509 -text -noout
