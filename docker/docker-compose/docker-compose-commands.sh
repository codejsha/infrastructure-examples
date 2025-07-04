######################################################################

### install docker-compose

DOCKER_COMPOSE_VERSION="v2.28.1"

sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# sudo ln -snf /usr/local/bin/docker-compose /usr/bin/docker-compose

### homebrew
brew install docker-compose

### chocolatey
choco install -y docker-compose
