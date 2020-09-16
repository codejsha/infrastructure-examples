#!/usr/bin/bash

mkdir -p ${HOME}/.kube
sudo scp root@controlplane1.example.com:/root/.kube/config ${HOME}/.kube/config

sudo mkdir -p /etc/ssl/etcd/ssl/
sudo scp root@controlplane1.example.com:/etc/ssl/etcd/ssl/* /etc/ssl/etcd/ssl/
