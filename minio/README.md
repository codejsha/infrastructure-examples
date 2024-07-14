# MinIO

## Install MinIO Client (CLI)

### Binary/Archive

```bash
curl -LJO https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
sudo mv mc /usr/local/bin
sudo chown root:root /usr/local/bin/mc
```

### Homebrew

```sh
brew install minio-mc
```

## Install MinIO Server

### Binary/Archive

```bash
curl -LJO https://dl.min.io/server/minio/release/linux-amd64/minio
chmod +x minio
sudo chown root:root minio
sudo mv minio /usr/local/bin
```

default root id/pw: `minioadmin:minioadmin`

### Docker

- MinIO Docker Hub: <https://hub.docker.com/r/minio/minio>

### Linux Service

- MinIO Init/Service Scripts: <https://github.com/minio/minio-service>

## Install KES

### Binary/Archive

```bash
curl -LJO https://github.com/minio/kes/releases/latest/download/kes-linux-amd64
chmod +x kes-linux-amd64
sudo mv kes-linux-amd64 /usr/local/bin/kes
```

### Homebrew

```sh
brew install minio/stable/kes
```

## References

- MinIO: <https://github.com/minio/minio>
- MinIO Client: <https://github.com/minio/mc>
- MinIO Operator: <https://github.com/minio/operator>
- MinIO Console: <https://github.com/minio/console>
- MinIO Grafana Dashboard: <https://grafana.com/grafana/dashboards/13502>

AWS CLI:

- AWS CLI with MinIO Server: <https://docs.minio.io/docs/aws-cli-with-minio.html>
- AWS CLI version 2 images: <https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-docker.html>
- Configuration and credential file settings: <https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html>
