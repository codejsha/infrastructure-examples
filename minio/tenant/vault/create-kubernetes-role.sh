#!/bin/bash

vault write auth/kubernetes/role/minio-issuer \
    bound_service_account_names=issuer,tenant-issuer,tenant-console-issuer \
    bound_service_account_namespaces=minio-operator,minio-tenant \
    policies=pki \
    ttl=4860h
