#!/usr/bin/bash

kubectl config set-context --current --namespace=tekton-pipelines

kubectl apply --filename https://raw.githubusercontent.com/tektoncd/catalog/master/task/git-clone/0.2/git-clone.yaml
kubectl apply --filename https://raw.githubusercontent.com/tektoncd/catalog/master/task/maven/0.2/maven.yaml
# kubectl apply --filename https://raw.githubusercontent.com/tektoncd/catalog/master/task/kaniko/0.1/kaniko.yaml
kubectl apply --filename kaniko-0.1-custom.yaml

kubectl apply --filename docker-resource.yaml
kubectl apply --filename git-resource.yaml
kubectl apply --filename maven-resource.yaml
kubectl apply --filename pvc.yaml
kubectl apply --filename pipeline.yaml
kubectl create --filename run.yaml

tkn pipelineruns logs --follow --last
