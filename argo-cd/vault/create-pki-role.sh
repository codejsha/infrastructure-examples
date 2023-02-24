#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

# export VAULT_ADDR="https://vault.example.com"
# export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
# export VAULT_CACERT="${HOME}/.vault/ca.crt"

vault write pki_int/roles/argocd \
    allowed_domains="localhost,argocd.example.com,argocd-server,argocd-server.argocd,argocd-server.argocd.svc,argocd-server.argocd.svc.cluster.local,argocd-repo.example.com,argocd-repo-server,argocd-repo-server.argocd,argocd-repo-server.argocd.svc,argocd-repo-server.argocd.svc.cluster.local,argocd-dex.example.com,argocd-dex-server,argocd-dex-server.argocd,argocd-dex-server.argocd.svc,argocd-dex-server.argocd.svc.cluster.local" \
    allow_subdomains="true" \
    allow_bare_domains="true" \
    allow_glob_domains="true" \
    max_ttl="8760h"
