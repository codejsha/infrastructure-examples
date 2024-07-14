# kind

## Install

### Binary/Archive

```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

### Homebrew

```sh
brew install kind

# brew uninstall kind
```

### Chocolatey

```ps1
choco install -y kind

# choco uninstall -y kind
```

## References

- kind Website: <https://kind.sigs.k8s.io/>
- kind GitHub: <https://github.com/kubernetes-sigs/kind/>
