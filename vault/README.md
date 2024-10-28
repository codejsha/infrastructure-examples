# HashiCorp Vault

HashiCorp Vault is a tool for managing secrets and protecting sensitive data. It is designed to provide a secure, reliable, and scalable platform for managing secrets, such as tokens, passwords, certificates, and encryption keys.

## Install CLI

### DNF/YUM

```bash
# dnf
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install vault

# yum
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vault
```

### Homebrew

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/vault
```

### Chocolatey

```ps1
choco install -y vault
```

## References

- [HashiCorp Vault Website](https://www.vaultproject.io/)
- [HashiCorp Vault GitHub](https://github.com/hashicorp/vault)
- [HashiCorp Vault Helm Chart](https://github.com/hashicorp/vault-helm)
