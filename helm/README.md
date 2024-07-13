# Helm

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. A Helm chart is a package format for defining, installing, and upgrading Kubernetes applications.

## Install Helm CLI

### DNF/YUM

```bash
sudo dnf install -y helm
```

### APT

```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

### Binary/Archive

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
sudo ./get_helm.sh
# rm -f get_helm.sh
# helm completion bash | sudo tee /etc/bash_completion.d/helm
# source <(helm completion bash)
```

### Homebrew

```sh
brew install -y helm
```

### Chocolatey

```ps1
choco install -y kubernetes-helm

# choco uninstall -y kubernetes-helm
```

## Helmfile

### Install

```ps1
# powershell
choco install -y kubernetes-helmfile

# choco uninstall -y kubernetes-helmfile
```

## Helmsman

### Install

```bash
# on Linux
curl -L https://github.com/Praqma/helmsman/releases/download/v3.17.0/helmsman_3.17.0_linux_amd64.tar.gz | tar zx
# on MacOS
curl -L https://github.com/Praqma/helmsman/releases/download/v3.17.0/helmsman_3.17.0_darwin_amd64.tar.gz | tar zx

chmod +x helmsman
sudo mv helmsman /usr/local/bin/helmsman
rm -f LICENSE README.md
```

## Helm chart

A Helm chart is a collection of files which describe a Kubernetes application and its dependencies, and it can be versioned, shared, and reused by others.
Typically, a Helm chart includes a set of YAML files that define Kubernetes resources as well as templates that allow for customization of the resources.

## ChartMuseum

- Helm chart (:warning: Deprecated): <https://github.com/helm/charts/tree/master/stable/docker-registry>
- Harbor: <https://github.com/goharbor/harbor>

## References

- Helm Documentation: <https://helm.sh/docs/>
- Advanced Helm Techniques: <https://helm.sh/docs/topics/advanced/>
- alpine/helm docker image: <https://hub.docker.com/r/alpine/helm>
