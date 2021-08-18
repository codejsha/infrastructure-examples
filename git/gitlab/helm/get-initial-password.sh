#!/bin/bash

### username: root

### get initial password
kubectl get secret my-gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo
