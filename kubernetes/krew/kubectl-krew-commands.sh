######################################################################

### install krew (binary)

### requirement:
### - git

### download and install
(
    set -x; cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    KREW="krew-${OS}_${ARCH}" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
    tar zxvf "${KREW}.tar.gz" &&
    ./"${KREW}" install krew
)

### add path
export PATH="${PATH}:${KREW_ROOT:-"${HOME}/.krew"}/bin"

######################################################################

### install krew

### homebrew
brew install krew

### chocolatey
choco install -y krew

######################################################################

### krew

kubectl krew

kubectl krew index list
kubectl krew update

kubectl krew list
kubectl krew info
kubectl krew upgrade

kubectl krew install
kubectl krew uninstall

kubectl krew search
kubectl krew version

######################################################################

### commands

### ca-cert
kubectl ca-cert

### view secret
kubectl view-secret ${SECRET_NAME}

### tail
kubectl tail
kubectl tail --ns opentelemetry

### tree
kubectl tree
kubectl tree deployments
kubectl tree replicationcontrollers
kubectl tree replicasets
kubectl tree statefulsets
