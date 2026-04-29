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

######################################################################

docker compose version
docker compose config
docker compose logs
docker compose logs --follow

######################################################################

### up/start

docker compose up
docker compose up --detach
docker compose up -d
docker compose up -d --force-recreate proxy
docker compose -f docker-compose.local.yaml up -d --build

docker compose -f docker-compose.local.yaml down
docker compose -f docker-compose.local.yaml down --volumes

docker compose start

docker compose restart
docker compose -f docker-compose.local.yaml restart grafana

######################################################################

### stop/down

docker compose stop

docker compose down
docker compose down --remove-orphans --volumes

######################################################################

docker compose top

docker compose ps
docker compose ps --services
docker compose ps --filter "status=running"
docker compose ps --filter "status=dead"
docker compose ps --filter "status=exited"

######################################################################

### exec

docker compose exec httpd /bin/bash
docker compose exec --detach httpd /bin/bash -c "ls -al /var/www/html"
docker compose exec --detach httpd /bin/sh -c "ls -al /var/www/html"

######################################################################

docker compose kill
docker compose rm
