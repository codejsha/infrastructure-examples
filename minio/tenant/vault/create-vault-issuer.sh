#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

kubectl create serviceaccount --namespace minio-tenant minio-tenant-issuer
kubectl create serviceaccount --namespace minio-tenant minio-tenant-console-issuer

ISSUER_SECRET_REF="$(kubectl get serviceaccount --namespace minio-tenant minio-tenant-issuer -o json | jq -r ".secrets[].name")"

cat <<EOF | kubectl apply --filename -
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: minio-tenant-issuer
  namespace: minio-tenant
spec:
  vault:
    server: http://my-vault.vault-system.svc.cluster.local:8200
    path: pki/sign/minio-tenant
    auth:
      kubernetes:
        mountPath: /v1/auth/kubernetes
        role: minio-issuer
        secretRef:
          name: ${ISSUER_SECRET_REF}
          key: token
EOF

ISSUER_SECRET_REF="$(kubectl get serviceaccount --namespace minio-tenant minio-tenant-console-issuer -o json | jq -r ".secrets[].name")"

cat <<EOF | kubectl apply --filename -
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: minio-tenant-console-issuer
  namespace: minio-tenant
spec:
  vault:
    server: http://my-vault.vault-system.svc.cluster.local:8200
    path: pki/sign/minio-tenant-console
    auth:
      kubernetes:
        mountPath: /v1/auth/kubernetes
        role: minio-issuer
        secretRef:
          name: ${ISSUER_SECRET_REF}
          key: token
EOF
