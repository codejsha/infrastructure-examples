# Docker

Docker is a platform for developers and engineers to develop, deploy, and run applications with containerized environments.
A container is a standard unit of software that packages up the code, libraries, dependencies, and runtime.
Containers are isolated from the underlying infrastructure and can be easily deployed, scaled, and managed so the application runs quickly and reliably from one computing environment to another.
Docker isolates containers from the host machine by using several built-in Linux kernel features, such as namespaces and control groups (cgroups).

## Install

### DNF/YUM

```bash
# dnf
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io

sudo usermod -a -G docker ${USER}
sudo systemctl enable docker
sudo systemctl start docker

exit
```

```bash
# yum
sudo yum remove -y \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io

sudo usermod -a -G docker ${USER}
sudo systemctl enable docker
sudo systemctl start docker

exit
```

```bash
# yum for specific version
DOCKER_VERSION="19.03.15"
CONTAINERD_VERSION="1.3.9"

sudo yum remove -y \
    docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y \
    docker-ce-${DOCKER_VERSION} \
    docker-ce-cli-${DOCKER_VERSION} \
    containerd.io-${CONTAINERD_VERSION}

sudo usermod -a -G docker ${USER}
sudo systemctl enable docker
sudo systemctl start docker

exit
```

### APT

```bash
curl -fsSL https://get.docker.com | sudo sh

sudo usermod -a -G docker ${USER}

exit
```

### Homebrew

```sh
brew install --cask docker
```

### Chocolatey

```ps1
choco install -y docker-cli
```

## Build image

- `docker build` Reference: <https://docs.docker.com/engine/reference/commandline/build/>
- Docker Security Cheat Sheet: <https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html>

## Daemon

- Daemon CLI (dockerd): <https://docs.docker.com/engine/reference/commandline/dockerd/>
- Test an insecure registry: <https://docs.docker.com/registry/insecure/>
- daemon configuration example: `daemon.json` (`/etc/docker/daemon.json`)

## Others

- override docker service: `override-docker-service.sh`
- configuration file: `config.json` (`${HOME}/.docker/config.json`)
