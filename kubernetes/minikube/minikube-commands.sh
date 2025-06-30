######################################################################

$env:MINIKUBE_HOME="E:\.minikube"

######################################################################

### install minikube

### homebrew
brew install minikube

### chocolatey
choco install -y minikube

######################################################################

### start minikube

### docker
minikube start --driver=docker

### kvm
minikube start \
   --driver=kvm2 \
   --extra-config=kubelet.authentication-token-webhook=true \
   --extra-config=kubelet.authorization-mode=Webhook \
   --extra-config=scheduler.address=0.0.0.0 \
   --extra-config=controller-manager.address=0.0.0.0

### podman
minikube start \
   --driver=podman \
   --container-runtime=cri-o \
   --cri-socket=/var/run/crio/crio.sock \
   --extra-config=kubelet.authentication-token-webhook=true \
   --extra-config=kubelet.authorization-mode=Webhook \
   --extra-config=scheduler.address=0.0.0.0 \
   --extra-config=controller-manager.address=0.0.0.0

### specific kubernetes version
minikube start --kubernetes-version=v1.32.5

######################################################################

minikube addons
minikube addons enable
minikube addons disable
minikube addons list

minikube addons enable ambassador
minikube addons enable auto-pause
minikube addons enable cloud-spanner
minikube addons enable csi-hostpath-driver
minikube addons enable dashboard
minikube addons enable default-storageclass
minikube addons enable efk
minikube addons enable freshpod
minikube addons enable gcp-auth
minikube addons enable gvisor
minikube addons enable headlamp
minikube addons enable helm-tiller
minikube addons enable inaccel
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable istio
minikube addons enable istio-provisioner
minikube addons enable kong
minikube addons enable kubevirt
minikube addons enable logviewer
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable nvidia-driver-installer
minikube addons enable nvidia-gpu-device-plugin
minikube addons enable olm
minikube addons enable pod-security-policy
minikube addons enable portainer
minikube addons enable registry
minikube addons enable registry-aliases
minikube addons enable registry-creds
minikube addons enable storage-provisioner
minikube addons enable storage-provisioner-gluste
minikube addons enable volumesnapshots


######################################################################

### config
minikube config
minikube config view

### resource
minikube config set memory 10240
minikube config set memory 16384
minikube config set memory 32768
minikube config set cpus 4

### driver
minikube config set driver none
minikube config set driver kvm2
minikube config set driver docker
minikube config set driver podman

### podman
minikube config set driver podman
minikube config set container-runtime cri-o

######################################################################

minikube cache

minikube dashboard
minikube dashboard --url

minikube docker-env
minikube ip
minikube kubectl
minikube logs
minikube mount

minikube node
minikube node add
minikube node delete
minikube node list
minikube node start
minikube node stop

minikube pause
minikube podman-env
minikube profile
minikube delete
minikube delete --all --purge

minikube service
minikube service list

minikube ssh
minikube ssh-host
minikube ssh-key

minikube start
minikube status
minikube stop

minikube ktunnel
minikube unpause
minikube update-check
minikube update-context
minikube version
