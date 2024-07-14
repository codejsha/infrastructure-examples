# Kustomize

## Install

### Binary/Archive

```bash
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash

sudo mv kustomize /usr/local/bin
sudo chown root:root /usr/local/bin/kustomize
```

### Homebrew

```sh
brew install kustomize

# brew uninstall kustomize
```

### Chocolatey

```ps1
choco install -y kustomize

# choco uninstall -y kustomize
```

### Docker Image

```bash
docker pull registry.k8s.io/kustomize/kustomize:v5.0.0
```

## References

- kustomize GitHub: <https://github.com/kubernetes-sigs/kustomize>
