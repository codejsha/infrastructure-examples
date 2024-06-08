#!/bin/bash
# trap 'echo "${BASH_SOURCE[0]}: line ${LINENO}: status ${?}: user ${USER}: func ${FUNCNAME[0]}"' ERR
# set -o errexit
# set -o errtrace

### helm 3
# HELM_VERSION="3.5.1"
# curl -LJO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz
# tar -xzf helm-v${HELM_VERSION}-linux-amd64.tar.gz
# sudo mv linux-amd64/helm /usr/local/bin/helm
# sudo chown root:root /usr/local/bin/helm

### helm 2
# HELM_VERSION="2.17.0"
# curl -LJO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz
# tar -xzf helm-v${HELM_VERSION}-linux-amd64.tar.gz
# sudo mv linux-amd64/helm /usr/local/bin/helm
# sudo chown root:root /usr/local/bin/helm

### install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
rm -f get_helm.sh
helm completion bash | sudo tee /etc/bash_completion.d/helm
source <(helm completion bash)

### install helm (rhel)
# sudo dnf install helm

### install helm (ubuntu)
# curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
# sudo apt-get install apt-transport-https --yes
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
# sudo apt-get update
# sudo apt-get install helm

### helm repo
# helm repo add stable https://charts.helm.sh/stable
# helm repo add incubator https://charts.helm.sh/incubator
# helm repo list
# helm repo update
