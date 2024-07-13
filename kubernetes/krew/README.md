# Krew

## Install

### Binary/Archive

```bash
### requirement:
### git

### download and install
(
    set -x; cd "$(mktemp -d)" &&
    OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
    KREW="krew-${OS}_${ARCH}" &&
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
    tar zxvf "${KREW}.tar.gz" &&
    ./"${KREW}" install krew
)

### add path
# PATH="${KREW_ROOT:-"${HOME}/.krew"}/bin:${PATH}"
# export PATH
```

### Homebrew

```sh
brew install -y krew

# brew uninstall -y krew
```

### Chocolatey

```ps1
choco install -y krew

# choco uninstall -y krew
```

## References

- <https://krew.sigs.k8s.io/>
