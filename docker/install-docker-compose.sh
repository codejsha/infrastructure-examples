#!/usr/bin/bash

DOCKER_COMPOSE_VERSION="1.26.2"

sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# sudo ln -snf /usr/local/bin/docker-compose /usr/bin/docker-compose

# sudo yum install -y docker-compose
