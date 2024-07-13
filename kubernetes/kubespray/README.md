# Installing Kubernetes with Kubespray

Table of Contents:

- [Pre-install](#pre-install)
- [Virtual machine configuration](#virtual-machine-configuration)
  - [1. Create Hyper-V VMs](#1-create-hyper-v-vms)
  - [2. Install OS](#2-install-os)
  - [3. Kubernetes requirements](#3-kubernetes-requirements)
  - [4. Add scripts](#4-add-scripts)
  - [5. Copy vhd](#5-copy-vhd)
- [Host configuration](#host-configuration)
  - [1. Set hostname](#1-set-hostname)
  - [2. Set network](#2-set-network)
  - [3. Copy ssh keys](#3-copy-ssh-keys)
- [Deploy cluster](#deploy-cluster)
  - [1. Configure cluster settings](#1-configure-cluster-settings)
  - [2. Run playbook](#2-run-playbook)
- [Post-install](#post-install)
  - [1. Copy config and cert files](#1-copy-config-and-cert-files)
  - [2. Create dashboard ingress](#2-create-dashboard-ingress)
- [References](#references)

## Pre-install

```powershell
### powershell
.\helper.ps1
```

## Virtual machine configuration

### 1. Create Hyper-V VMs

```powershell
### powershell
.\create-kube-vm.ps1
```

### 2. Install OS

manually install linux (CentOS)

update packages:

```bash
sudo dnf update -y
sudo yum update -y
```

### 3. Kubernetes requirements

```bash
bash ./pre-install.sh
```

### 4. Add scripts

- `set-hostname.sh`
- `set-network.sh` or `set-network-dual.sh`

### 5. Copy vhd

```powershell
### powershell
.\convert-kube-vhd.ps1
```

## Host configuration

### 1. Set hostname

```bash
# controlplane1
bash ./set-hostname.sh c1
# controlplane2
bash ./set-hostname.sh c2
# controlplane3
bash ./set-hostname.sh c3
# node1
bash ./set-hostname.sh n1
# node2
bash ./set-hostname.sh n2
# node3
bash ./set-hostname.sh n3
```

### 2. Set network

```bash
# one network
bash ./set-network.sh

# two networks
bash ./set-network-dual.sh
```

### 3. Copy ssh keys

```bash
bash ./pre-copy-ssh-key.sh
export PASSWORD="${PASSWORD}"
bash ./copy-ssh-key.sh
```

## Deploy cluster

### 1. Configure cluster settings

- `all.yaml`
- `docker.yaml`
- `addons.yaml`
- `k8s-cluster.yaml`
- `k8s-net-calico.yml`

### 2. Run playbook

```bash
export PASSWORD="${PASSWORD}"
bash ./install-k8s-kubespray.sh
```

## Post-install

### 1. Copy config and cert files

```bash
bash ./post-install.sh
```

### 2. Create dashboard ingress

```bash
bash ./dashboard-clusterrolebinding.sh
kubectl apply --filename dashboard-ingress.yaml
```

## References

- Kubespray Website: <https://kubespray.io/>
- Kubespray GitHub: <https://github.com/kubernetes-sigs/kubespray>
