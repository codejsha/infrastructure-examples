# Kubernetes

## CLI Tools

- kubectl: <https://kubernetes.io/docs/tasks/tools/install-kubectl>
- kubectl-aliases: <https://github.com/ahmetb/kubectl-aliases>
- krew: [/infrastructure-examples/kubernetes/krew](/kubernetes/krew/)
- kubectx & kubens: <https://github.com/ahmetb/kubectx>

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
