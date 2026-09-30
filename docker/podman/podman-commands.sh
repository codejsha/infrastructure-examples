######################################################################

### install

### podman
sudo dnf install -y podman
sudo yum install -y podman
brew install podman

### podman compose
sudo dnf install -y podman-compose
sudo yum install -y podman-compose

######################################################################

podman machine init
podman machine start
podman machine stop

######################################################################

### prune system
podman system prune -a --volumes

######################################################################

### build image
podman build \
    --platform linux/amd64 \
    --file ./ci/Dockerfile \
    --build-arg SERVICE_NAME="catalog" \
    --tag harbor.example.com/bookstore/catalog:0.1.0 .

### push image
podman push harbor.example.com/bookstore/catalog:0.1.0
podman push harbor.example.com/bookstore/catalog:0.1.0 \
    --cert-dir /path/to/certs --log-level debug
podman push harbor.example.com/bookstore/catalog:0.1.0 \
    --tls-verify=false --log-level debug
