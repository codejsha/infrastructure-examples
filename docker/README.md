# Docker

Docker is a platform for developers and engineers to develop, deploy, and run applications with containerized environments.
A container is a standard unit of software that packages up the code, libraries, dependencies, and runtime.
Containers are isolated from the underlying infrastructure and can be easily deployed, scaled, and managed so the application runs quickly and reliably from one computing environment to another.
Docker isolates containers from the host machine by using several built-in Linux kernel features, such as namespaces and control groups (cgroups).

## Install

```bash
bash ./install-docker.sh
```

## Build image

- `docker build` Reference: https://docs.docker.com/engine/reference/commandline/build/
- Docker Security Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html

## Daemon

- Daemon CLI (dockerd): https://docs.docker.com/engine/reference/commandline/dockerd/
- Test an insecure registry: https://docs.docker.com/registry/insecure/
- example of daemon configuration file: `daemon.json` (`/etc/docker/daemon.json`)

## Docker Compose

- https://github.com/docker/compose

## Docker Registry

- Docker container: https://docs.docker.com/registry/deploying/
- Helm chart (⚠️ Deprecated chart): https://github.com/helm/charts/tree/master/stable/docker-registry
- Harbor: https://github.com/goharbor/harbor

## Others

- override docker service: `override-docker-service.sh`
- configuration file: `config.json` (`${HOME}/.docker/config.json`)
