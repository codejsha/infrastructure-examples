# Docker Compose

## Install

### Binary/Archive

```bash
DOCKER_COMPOSE_VERSION="v2.28.1"

sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# sudo ln -snf /usr/local/bin/docker-compose /usr/bin/docker-compose
```

### Homebrew

```sh
brew install -y docker-compose

# brew uninstall -y docker-compose
```

### Chocolatey

```ps1
choco install -y docker-compose

# choco uninstall -y docker-compose
```

## References

- https://github.com/docker/compose
