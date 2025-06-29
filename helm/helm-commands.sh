######################################################################

docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm alpine/helm version
docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm alpine/helm --help

alias helm="docker container run --rm -it -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm -v ~/.config/helm:/root/.config/helm -v ~/.cache/helm:/root/.cache/helm alpine/helm"
alias helm="docker container run --rm -it --env HELM_EXPERIMENTAL_OCI=1 -v $(pwd):/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm -v ~/.config/helm:/root/.config/helm -v ~/.cache/helm:/root/.cache/helm alpine/helm"

######################################################################

### install helm cli

### dnf/yum
sudo dnf install -y helm

### apt
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

### binary/archive
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
# rm -f get_helm.sh
# helm completion bash | sudo tee /etc/bash_completion.d/helm
# source <(helm completion bash)

### homebrew
brew install helm

### chocolatey
choco install -y kubernetes-helm

######################################################################

### install helmfile

choco install -y kubernetes-helmfile

######################################################################

### install helmsman

### on linux
curl -L https://github.com/Praqma/helmsman/releases/download/v3.17.0/helmsman_3.17.0_linux_amd64.tar.gz | tar zx
### on macos
curl -L https://github.com/Praqma/helmsman/releases/download/v3.17.0/helmsman_3.17.0_darwin_amd64.tar.gz | tar zx

chmod +x helmsman
sudo mv helmsman /usr/local/bin/helmsman
rm -f LICENSE README.md

######################################################################

### repo

### add
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add --username ${USERNAME} --password ${PASSWORD} local-harbor http://harbor.example.com/chartrepo/library
helm repo add --username ${USERNAME} --password ${PASSWORD} --insecure-skip-tls-verify local-harbor https://harbor.example.com/chartrepo/library
helm repo add --username ${USERNAME} --password ${PASSWORD} --ca-file /mnt/c/Users/user/.docker/certs.d/local-harbor-ca.crt --insecure-skip-tls-verify local-harbor https://harbor.example.com/chartrepo/library

### list
helm repo list

### update
helm repo update

### search
helm search repo ingress-nginx/ingress-nginx
helm search repo --versions ingress-nginx/ingress-nginx

### health check
curl --insecure --verbose http://chartmuseum.example.com/health

######################################################################

### plugin

### install plugin
helm plugin install https://github.com/chartmuseum/helm-push.git

### list
helm plugin list

######################################################################

### chart

### list
helm list
helm list --all

### show
helm show chart ingress-nginx/ingress-nginx
helm show readme ingress-nginx/ingress-nginx
helm show values ingress-nginx/ingress-nginx
helm show values --version 5.7.12 jenkins/jenkins

### package
helm package ./chart

### push (plugin)
helm cm-push tomcat-9.0.0.tgz local-harbor
helm cm-push tomcat-9.0.0.tgz http://harbor.example.com/chartrepo/library
helm cm-push --force tomcat-9.0.0.tgz local-harbor
helm cm-push --insecure tomcat-9.0.0.tgz local-harbor

### push
export HELM_EXPERIMENTAL_OCI=1
helm push --ca-file ./example-int-ca.crt config-server-*.tgz oci://harbor.example.com/bookstore-helm-charts
helm push --plain-http config-server-*.tgz oci://harbor.example.com/bookstore-helm-charts

### pull
helm pull --untar --untardir charts ingress-nginx/ingress-nginx

### install / upgrade
helm install my-release
helm upgrade my-release
helm upgrade --install my-release

### uninstall
helm uninstall my-release

### rollback
helm rollback my-release

### dependency
helm dependency update

######################################################################

### registry

### login
helm registry login --insecure harbor.example.com

######################################################################

### status
helm status my-release
