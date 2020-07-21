#!/usr/bin/bash

USERNAME="admin"
PASSWORD="changeit"

NAMESPACE="registry-system"
kubectl create namespace ${NAMESPACE}

docker run --entrypoint htpasswd registry:2.7.0 -Bbn ${USERNAME} ${PASSWORD} > ./htpasswd

helm install my-docker-registry \
    --namespace ${NAMESPACE} \
    --set ingress.enabled="true" \
    --set ingress.path="/" \
    --set ingress.hosts={"registry.kube.example.com"} \
    --set ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set ingress.annotations."nginx\.ingress\.kubernetes\.io/proxy-body-size"="0" \
    --set persistence.enabled="true" \
    --set persistence.storageClass="rook-ceph-block" \
    --set storage="s3" \
    --set secrets.htpasswd="$(cat ./htpasswd)" \
    --set secrets.s3.accessKey="admin" \
    --set secrets.s3.secretKey="changeit" \
    --set s3.region="us-east-1" \
    --set s3.regionEndpoint="http://10.10.10.52:9000" \
    --set s3.bucket="myimage" \
    --set s3.encrypt="false" \
    --set s3.secure="false" \
    --version 1.9.3 \
    stable/docker-registry
