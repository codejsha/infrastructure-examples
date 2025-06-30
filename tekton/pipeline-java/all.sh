#!/bin/bash
trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
set -o errexit
set -o errtrace

### task
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.4/git-clone.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/maven/0.2/maven.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/kaniko/0.4/kaniko.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/kubernetes-actions/0.1/kubernetes-actions.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/istio-canary-release/0.1/istio-canary-release.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-cli/0.2/git-cli.yaml
kubectl apply --namespace tekton-pipelines --filename https://raw.githubusercontent.com/tektoncd/catalog/main/task/argocd-task-sync-and-wait/0.1/argocd-task-sync-and-wait.yaml
kubectl apply --namespace tekton-pipelines --filename kustomize/kustomize-cli-task.yaml
kubectl apply --namespace tekton-pipelines --filename argocd/argocd-set-task.yaml

### git ci
cd git
kubectl apply --namespace tekton-pipelines --filename git-ci-secret.yaml
kubectl apply --namespace tekton-pipelines --filename git-ci-serviceaccount.yaml
kubectl apply --namespace tekton-pipelines --filename git-ci-role.yaml
kubectl apply --namespace tekton-pipelines --filename git-ci-rolebinding.yaml
cd ..

### git cd
cd git
kubectl apply --namespace tekton-pipelines --filename git-cd-secret.yaml
kubectl apply --namespace tekton-pipelines --filename git-cd-serviceaccount.yaml
kubectl apply --namespace tekton-pipelines --filename git-cd-rolebinding.yaml
kubectl apply --namespace tekton-pipelines --filename git-cd-input-asset-configmap.yaml
cd ..

### docker
cd docker
export REGISTRY_AUTH="$(echo -n admin:${PASSWORD} | base64)"
envsubst < ./docker-configmap.yaml > ./docker-configmap-temp.yaml
kubectl apply --namespace tekton-pipelines --filename docker-configmap-temp.yaml
cd ..

### kubernetes
cd kubernetes
# kubectl apply --namespace tekton-pipelines --filename kubeconfig-configmap.yaml
# kubectl apply --namespace tekton-pipelines --filename kubeconfig-configmap-temp.yaml
# kubectl apply --namespace tekton-pipelines --filename kubeconfig-configmap-docker-desktop.yaml
kubectl apply --namespace tekton-pipelines --filename kubeconfig-configmap-docker-desktop-temp.yaml
cd ..

### argocd
cd argocd
export ARGOCD_AUTH_TOKEN="${ARGOCD_AUTH_TOKEN}"
envsubst < ./argocd-secret.yaml > ./argocd-secret-temp.yaml
kubectl apply --namespace tekton-pipelines --filename argocd-secret-temp.yaml
kubectl apply --namespace tekton-pipelines --filename argocd-configmap.yaml
kubectl apply --namespace argocd --filename application-project.yaml
kubectl apply --namespace argocd --filename application.yaml
cd ..

### maven
cd maven
kubectl apply --namespace tekton-pipelines --filename maven-configmap.yaml
cd ..

### tekton
kubectl apply --namespace tekton-pipelines --filename pvc.yaml
kubectl apply --namespace tekton-pipelines --filename pipeline.yaml
kubectl apply --namespace tekton-pipelines --filename triggerbinding-cel.yaml
# kubectl apply --namespace tekton-pipelines --filename triggerbinding-gitlab.yaml
kubectl apply --namespace tekton-pipelines --filename triggertemplate.yaml
kubectl apply --namespace tekton-pipelines --filename eventlistener-gitea.yaml
# kubectl apply --namespace tekton-pipelines --filename eventlistener-gitlab.yaml
# kubectl apply --namespace tekton-pipelines --filename eventlistener-ingress.yaml

### istio
cd istio
kubectl apply --namespace tekton-pipelines --filename eventlistener-traffic-management.yaml
cd ..
