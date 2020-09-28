#!/usr/bin/bash

mkdir -p ${HOME}/.kube
sudo scp root@kubecontrolplane1:/root/.kube/config ${HOME}/.kube/config
sudo chown -R $(id -un):$(id -gn) ${HOME}/.kube/config

sudo mkdir -p /etc/ssl/etcd/ssl/
sudo scp root@kubecontrolplane1:/etc/ssl/etcd/ssl/* /etc/ssl/etcd/ssl/
sudo chown -R root:$(id -gn) /etc/ssl/etcd/ssl/
