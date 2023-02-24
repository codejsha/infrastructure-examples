#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

export VAULT_NAMESPACE="vault" \
export VAULT_HELM_RELEASE_NAME="my-vault" \
export VAULT_SERVICE_NAME="my-vault" \
export WORKDIR="./tls"

mkdir -p ${WORKDIR}
mkdir -p ${HOME}/.vault

### generate the private key
openssl genrsa -out ${WORKDIR}/vault.key 2048

### create the csr
cat > ${WORKDIR}/vault.csr.conf <<EOF
[req]
default_bits = 2048
prompt = no
encrypt_key = yes
default_md = sha256
distinguished_name = req_distinguished_name
req_extensions = v3_req
[req_distinguished_name]
countryName            = "KR"                                                   # C
stateOrProvinceName    = "Seoul"                                                # ST
localityName           = "Gangnam"                                              # L
organizationName       = "system:nodes"                                         # O
commonName             = "system:node:*.${VAULT_NAMESPACE}.svc.cluster.local"   # CN
emailAddress           = "admin@example.com"                                    # CN/emailAddress
[v3_req]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth, clientAuth
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost
DNS.2 = vault.example.com
DNS.3 = ${VAULT_SERVICE_NAME}
DNS.4 = *.${VAULT_SERVICE_NAME}
DNS.5 = ${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}
DNS.6 = *.${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}
DNS.7 = ${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}.svc
DNS.8 = *.${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}.svc
DNS.9 = ${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}.svc.cluster.local
DNS.10 = *.${VAULT_SERVICE_NAME}.${VAULT_NAMESPACE}.svc.cluster.local
DNS.11 = ${VAULT_SERVICE_NAME}-internal
DNS.12 = *.${VAULT_SERVICE_NAME}-internal
DNS.13 = ${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}
DNS.14 = *.${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}
DNS.15 = ${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}.svc
DNS.16 = *.${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}.svc
DNS.17 = ${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}.svc.cluster.local
DNS.18 = *.${VAULT_SERVICE_NAME}-internal.${VAULT_NAMESPACE}.svc.cluster.local
DNS.19 = *.${VAULT_NAMESPACE}
IP.1 = 127.0.0.1
EOF
openssl req -new -key ${WORKDIR}/vault.key -out ${WORKDIR}/vault.csr -config ${WORKDIR}/vault.csr.conf

### issue the csr
cat > ${WORKDIR}/csr.yaml <<EOF
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
   name: vault-csr
spec:
   signerName: kubernetes.io/kubelet-serving
   request: $(cat ${WORKDIR}/vault.csr | base64 | tr -d '\n')
   usages:
   - digital signature
   - key encipherment
   - server auth
EOF
kubectl create -f ${WORKDIR}/csr.yaml

### approve the csr
kubectl certificate approve vault-csr
kubectl get csr vault-csr

######################################################################

### store the certificates and key in the kubernetes secrets store

SERVER_CERT=$(kubectl get csr vault-csr -o jsonpath='{.status.certificate}')
echo "${SERVER_CERT}" | openssl base64 -d -A -out ${WORKDIR}/vault.crt
kubectl config view \
    --raw \
    --minify \
    --flatten \
    -o jsonpath='{.clusters[].cluster.certificate-authority-data}' \
    | base64 -d > ${WORKDIR}/kubernetes-ca.crt
/bin/cp -pf ${WORKDIR}/kubernetes-ca.crt /home/prouser/.vault/ca.crt

kubectl create namespace ${VAULT_NAMESPACE}
kubectl label namespace ${VAULT_NAMESPACE} istio-injection=enabled

kubectl create secret generic vault-ha-tls \
   --namespace ${VAULT_NAMESPACE} \
   --from-file=vault.key=${WORKDIR}/vault.key \
   --from-file=vault.crt=${WORKDIR}/vault.crt \
   --from-file=kubernetes-ca.crt=${WORKDIR}/kubernetes-ca.crt

######################################################################

### deploy the vault cluster via helm with overrides

# helm repo add hashicorp https://helm.releases.hashicorp.com
# helm repo update

helm install ${VAULT_HELM_RELEASE_NAME} \
    --namespace ${VAULT_NAMESPACE} \
    --values values-ha-tls.yaml \
    --version 0.23.0 \
    hashicorp/vault

######################################################################

### initialize the vault and unseal it

# kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault operator init \
#     -key-shares=1 \
#     -key-threshold=1 \
#     -format=json > ${WORKDIR}/cluster-keys.json
# VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" ${WORKDIR}/cluster-keys.json)
# kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault operator unseal ${VAULT_UNSEAL_KEY}
#
# CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
# echo ${CLUSTER_ROOT_TOKEN} > ${HOME}/.vault/root_token.txt

######################################################################

### join other pods to the raft cluster

# kubectl exec -n ${VAULT_NAMESPACE} -it ${VAULT_HELM_RELEASE_NAME}-1 -- vault operator raft join -address=https://${VAULT_HELM_RELEASE_NAME}-1.vault-internal:8200 -leader-ca-cert="$(cat /vault/userconfig/vault-ha-tls/kubernetes-ca.crt)" -leader-client-cert="$(cat /vault/userconfig/vault-ha-tls/vault.crt)" -leader-client-key="$(cat /vault/userconfig/vault-ha-tls/vault.key)" https://${VAULT_HELM_RELEASE_NAME}-0.vault-internal:8200
# kubectl exec -n ${VAULT_NAMESPACE} -ti ${VAULT_HELM_RELEASE_NAME}-1 -- vault operator unseal ${VAULT_UNSEAL_KEY}
# kubectl exec -n ${VAULT_NAMESPACE} -it ${VAULT_HELM_RELEASE_NAME}-2 -- vault operator raft join -address=https://${VAULT_HELM_RELEASE_NAME}-2.vault-internal:8200 -leader-ca-cert="$(cat /vault/userconfig/vault-ha-tls/kubernetes-ca.crt)" -leader-client-cert="$(cat /vault/userconfig/vault-ha-tls/vault.crt)" -leader-client-key="$(cat /vault/userconfig/vault-ha-tls/vault.key)" https://${VAULT_HELM_RELEASE_NAME}-0.vault-internal:8200
# kubectl exec -n ${VAULT_NAMESPACE} -ti ${VAULT_HELM_RELEASE_NAME}-2 -- vault operator unseal ${VAULT_UNSEAL_KEY}

# ### export cluster root token
# export CLUSTER_ROOT_TOKEN=$(cat ${WORKDIR}/cluster-keys.json | jq -r ".root_token")
# kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault login ${CLUSTER_ROOT_TOKEN}
# ### list the raft peers
# kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault operator raft list-peers
# ### print ha status
# kubectl exec -n ${VAULT_NAMESPACE} ${VAULT_HELM_RELEASE_NAME}-0 -- vault status

######################################################################

### uninstall

# rm -rf ${WORKDIR}
# helm uninstall ${VAULT_HELM_RELEASE_NAME}
# kubectl delete csr vault-csr
# kubectl delete namespace ${VAULT_NAMESPACE}
