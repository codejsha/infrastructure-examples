# Kubernetes

## Install kubectl

### DNF/YUM

```bash
# This overwrites any existing configuration in /etc/yum.repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/repodata/repomd.xml.key
EOF

sudo yum install -y kubectl
```

### APT

```bash
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly

sudo apt-get update
sudo apt-get install -y kubectl
```

### Homebrew

```sh
brew install kubernetes-cli
# brew uninstall kubernetes-cli
```

### Chocolatey

```ps1
choco install -y kubernetes-cli
# choco uninstall -y kubernetes-cli
```

## CLI Tools

- kubectl: <https://kubernetes.io/docs/tasks/tools/install-kubectl>
- kubectl-aliases: <https://github.com/ahmetb/kubectl-aliases>
- krew: [/infrastructure-examples/kubernetes/krew](/kubernetes/krew/)
- kubectx & kubens: <https://github.com/ahmetb/kubectx>

```zsh
### kubectx & kubens
brew install kubectx
```

## Install Cluster

- minikube: [/infrastructure-examples/kubernetes/minikube](/kubernetes/minikube/)
- kind: [/infrastructure-examples/kubernetes/kind](/kubernetes/kind/)
- Kubespray: [Installing Kubernetes with Kubespray](/kubernetes/kubespray/)

## Resource Management

- Helm: [/infrastructure-examples/helm](/helm/)
- kustomize: [/infrastructure-examples/kubernetes/kustomize](/kubernetes/kustomize/)

## Linux daemon

### Docker

- `/etc/systemd/system/docker.service`
- `/etc/systemd/system/docker.service.d/docker-options.conf`
- `/etc/systemd/system/docker.service.d/docker-dns.conf`

### etcd

- `/etc/systemd/system/etcd.service`
- `/etc/etcd.env`

### Kubelet

- `/etc/systemd/system/kubelet.service`
- `/etc/kubernetes/kubelet.env`
