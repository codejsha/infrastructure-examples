######################################################################

function vault() { echo "+ vault ${@}">&2; command vault "${@}"; }

######################################################################

export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

export VAULT_SKIP_VERIFY="true"

kubectl -n vault port-forward service/my-vault 8200:8200
export VAULT_ADDR="https://localhost:8200"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
export VAULT_CACERT="${HOME}/.vault/ca.crt"

######################################################################

### initialize the vault and unseal it

export WORKDIR="./tls"
kubectl exec -n vault my-vault-0 -- vault operator init \
    -key-shares=1 \
    -key-threshold=1 \
    -format=json > ${WORKDIR}/cluster-keys.json
VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${WORKDIR}/cluster-keys.json)
kubectl exec -n vault my-vault-0 -- vault operator unseal ${VAULT_UNSEAL_KEY}

mkdir -p ${HOME}/.vault
CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
echo ${CLUSTER_ROOT_TOKEN} > ${HOME}/.vault/root_token.txt

export CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault login ${CLUSTER_ROOT_TOKEN}
kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault operator raft list-peers
kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault status

######################################################################

### unseal vault

VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${HOME}/.vault/cluster-keys.json)
kubectl exec -n vault my-vault-0 -- vault operator unseal ${VAULT_UNSEAL_KEY}

export CLUSTER_ROOT_TOKEN=$(cat ${HOME}/.vault/cluster-keys.json | jq -r ".root_token")
kubectl exec -n vault my-vault-0 -- vault login ${CLUSTER_ROOT_TOKEN}
kubectl exec -n vault my-vault-0 -- vault operator raft list-peers
kubectl exec -n vault my-vault-0 -- vault status

######################################################################

### connect to running container

NAMESPACE="vault"
VAULT_PODNAME="$(kubectl get pods --namespace ${NAMESPACE} --selector app.kubernetes.io/name=vault --output custom-columns=:metadata.name)"
kubectl exec -it --namespace ${NAMESPACE} ${VAULT_PODNAME} --container vault -- /bin/sh

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
    kubernetes_host="https://192.168.137.11:6443" \
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
curl -s https://vault.example.com/v1/pki/ca/pem | openssl x509 -text -noout

### certificate list
vault list pki/certs
vault list pki_int/certs
curl \
    --header "X-Vault-Token:${VAULT_TOKEN}" \
    --request LIST \
    https://vault.example.com/v1/pki/certs

### get certificate
vault read pki/cert/${SERIAL} -format="json" | jq -r '.data.certificate' |  openssl x509 -text -noout

######################################################################

### example1

kubectl exec -it -n vault my-vault-0 -- vault secrets enable -path=secret kv-v2
kubectl exec -it -n vault my-vault-0 -- vault kv put secret/tls/apitest username="user" password="secret"
kubectl exec -it -n vault my-vault-0 -- vault kv get secret/tls/apitest

kubectl -n vault get service my-vault
kubectl -n vault port-forward service/my-vault 8200:8200
export WORKDIR="./tls"
export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
curl --cacert ${WORKDIR}/kubernetes-ca.crt \
   --header "X-Vault-Token: ${VAULT_TOKEN}" \
   https://127.0.0.1:8200/v1/secret/data/tls/apitest | jq .data.data

######################################################################

### example2

jq -r ".unseal_keys_b64[]" ./vault-keys.json
VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ./vault-keys.json)
export VAULT_ADDR="https://vault.example.com"
export VAULT_TOKEN=$(echo $VAULT_UNSEAL_KEY | awk '{print $1;}')
kubectl exec --namespace vault my-vault-0 -- vault login ${VAULT_TOKEN}
vault secrets enable -path=secret kv-v2

kubectl exec -it --namespace vault my-vault-0 --container vault -- /bin/sh
vault login ${VAULT_TOKEN}

######################################################################

### debug

vault debug
vault debug -duration=1m -interval=10s -metrics-interval=5s -compress=false
vault debug -target=host -target=metrics

### audit log
vault audit enable -path=file_raw file \
        file_path=/vault/audit-law.log \
        log_raw=true
vault audit disable file_raw

### policy review (403 permission denied)
vault token create -policy=pki_int
vault token capabilities ${TOKEN} pki_int/sign/argocd
