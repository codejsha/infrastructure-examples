#!/bin/bash

curl -LJO https://confluent-for-kubernetes.s3-us-west-1.amazonaws.com/confluent-for-kubernetes-2.2.0.tar.gz
tar -xzf confluent-for-kubernetes-2.2.0.tar.gz

cd confluent-for-kubernetes-2.2.0-20211101/kubectl-plugin

kubectl krew install \
    --manifest="confluent-platform.yaml" \
    --archive="kubectl-confluent-linux-amd64.tar.gz"
