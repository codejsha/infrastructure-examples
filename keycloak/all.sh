#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

NAMESPACE="keycloak-system"
# NAMESPACE="my-keycloak-operator"

kubectl apply --namespace ${NAMESPACE} --filename keycloak-ldap-secret.yaml
kubectl apply --namespace ${NAMESPACE} --filename keycloak.yaml
kubectl apply --namespace ${NAMESPACE} --filename keycloak-realm.yaml
kubectl apply --namespace ${NAMESPACE} --filename keycloak-user.yaml
# kubectl apply --namespace ${NAMESPACE} --filename keycloak-backup.yaml
