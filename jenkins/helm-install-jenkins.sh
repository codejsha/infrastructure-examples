#!/usr/bin/bash

PASSWORD="changeit"

NAMESPACE="jenkins-system"
kubectl create namespace ${NAMESPACE}

helm install my-jenkins \
    --namespace ${NAMESPACE} \
    --set master.adminPassword="${PASSWORD}" \
    --set master.ingress.enabled="true" \
    --set master.ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
    --set master.ingress.path="/" \
    --set master.ingress.hostName="jenkins.kube.example.com" \
    --set persistence.storageClass="rook-ceph-block" \
    --version 2.1.0 \
    stable/jenkins

    # --set master.jenkinsUriPrefix="/jenkins" \
    
    ### for loadbalancer
    # --set master.serviceType="LoadBalancer" \
    # --set master.loadBalancerIP="10.10.10.50" \
