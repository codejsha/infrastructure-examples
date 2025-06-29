######################################################################

[ -f ~/.aliases/kubectl_aliases ] && source ~/.aliases/kubectl_aliases

source <(kubectl completion bash)

######################################################################

### install kubectl (dnf/yum)

### This overwrites any existing configuration in /etc/yum.repos.d/kubernetes.repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/repodata/repomd.xml.key
EOF

sudo yum install -y kubectl

######################################################################

### install kubectl (apt)

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

######################################################################

### install kubectl (homebrew)
brew install kubernetes-cli

### install kubectl (chocolatey)
choco install -y kubernetes-cli

######################################################################

### kubectx & kubens
brew install kubectx

######################################################################

### version
kubectl version
kubectl api-versions

######################################################################

### check logs and events
kubectl logs <pod-name> -c <init-container-name>
kubectl describe pod <pod-name>

######################################################################

### apply and delete resources

cat <<EOF | kubectl apply -f -
EOF
cat <<EOF | kubectl create -f -
EOF
cat <<EOF | kubectl delete --recursive -f
EOF

kubectl delete jobs --grace-period=0 --force
kubectl delete jobs --all
kubectl delete jobs --all --grace-period=0 --force
kubectl delete pods --grace-period=0 --force
kubectl delete pods --all --grace-period=0 --force

######################################################################

### storageclass

kubectl get storageclass

### standard
kubectl annotate --overwrite storageclass standard storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass standard storageclass.kubernetes.io/is-default-class=false
### local-path
kubectl annotate --overwrite storageclass local-path storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass local-path storageclass.kubernetes.io/is-default-class=false
### rook-ceph-block
kubectl annotate --overwrite storageclass rook-ceph-block storageclass.kubernetes.io/is-default-class=true
kubectl annotate --overwrite storageclass rook-ceph-block storageclass.kubernetes.io/is-default-class=false

######################################################################

### kubectx and kubens

kubectx
kubectx -
kubectx -h
kubectx -c
kubectx --current
kubectx docker-desktop

kubens
kubens -
kubens -h
kubens -c
kubens --current
kubens kube-system

######################################################################

### dashboard password
kubectl describe secrets kubernetes-dashboard-token --namespace kube-system | grep token: | awk '{print $2}'
