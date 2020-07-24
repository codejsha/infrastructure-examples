#!/usr/bin/bash

curl -JLO https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
tar -xvzf helm-v3.2.4-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com
helm repo list
helm repo update
