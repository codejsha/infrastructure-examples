# Docker

## Install

```bash
bash ./install-docker.sh
```

## Docker build

- https://docs.docker.com/engine/reference/commandline/build/

## Daemon

- https://docs.docker.com/engine/reference/commandline/dockerd/
- https://docs.docker.com/registry/insecure/

`/etc/docker/daemon.json` example: `daemon.json`

systemd cgroup driver:

```bash
  "exec-opts": ["native.cgroupdriver=systemd"],
```

### Override docker service

```bash
bash ./override-docker-service.sh
```

## Configuration file

`${HOME}/.docker/config.json` example: `config.json`

## Docker Compose

- https://github.com/docker/compose

```bash
bash ./install-docker-compose.sh
```

## Docker Registry

### Docker (container)

- https://docs.docker.com/registry/deploying/

```bash
bash ./docker-run-docker-registry.sh
```

### Kubernetes (Helm chart)

⚠️ Deprecated chart

https://github.com/helm/charts#%EF%B8%8F-deprecation-and-archive-notice

```bash
bash ./helm-install-docker-registry.sh
```
