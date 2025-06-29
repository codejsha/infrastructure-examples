######################################################################

### install podman

### dnf
sudo dnf install -y podman

### yum
sudo yum install -y podman

### homebrew
brew install podman

######################################################################

### podman compose

### dnf
sudo dnf install -y podman-compose

### yum
sudo yum install -y podman-compose

######################################################################

podmnan machine init
podman machine start
podman machine stop

######################################################################

### build image
podman build \
    --platform linux/amd64 \
    --file ./ci/Dockerfile \
    --build-arg SERVICE_NAME="catalog" \
    --tag harbor.example.com/bookstore/catalog:0.1.0 .

### push image
podman push harbor.example.com/bookstore/catalog:0.1.0
podman push --tls-verify=false harbor.example.com/bookstore/catalog:0.1.0
