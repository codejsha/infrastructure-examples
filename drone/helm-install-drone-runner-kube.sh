#!/usr/bin/bash

helm repo add drone https://charts.drone.io
helm repo update

if [ ! -f SHARED_SECRET.txt ]; then
    echo "ERROR: The SHARED_SECRET file does not exists!"
    exit
fi

SHARED_SECRET="$(cat SHARED_SECRET.txt)"

NAMESPACE="drone-system"

# helm install my-drone-runner \
helm upgrade --install my-drone-runner \
    --namespace ${NAMESPACE} \
    --set ingress.enabled="true" \
    --set ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set ingress.hosts[0].host="drone-runner.kube.example.com" \
    --set ingress.hosts[0].paths[0]="/" \
    --set env.DRONE_RPC_SECRET="${SHARED_SECRET}" \
    --set env.DRONE_RPC_HOST="my-drone" \
    --set env.DRONE_RPC_PROTO="http" \
    --set env.DRONE_NAMESPACE_DEFAULT="${NAMESPACE}" \
    --version 0.1.3 \
    drone/drone-runner-kube
