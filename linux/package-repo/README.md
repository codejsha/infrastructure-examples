# Package Management

## Install DNF

```bash
sudo yum install -y dnf

sudo yum install -y dnf-plugins-core
# sudo dnf install 'dnf-command(config-manager)'

# sudo dnf config-manager --set-enabled PowerTools
```

## Install EPEL

```bash
sudo dnf install -y epel-release

sudo yum install -y epel-release
```

## Install YUM Utils

```bash
sudo yum install -y yum-utils
```

## Package Repo Server/Client

Local RPM Package Repository Server Example: [/infrastructure-examples/linux/package-repo/rpm-package-repo-server](/linux/package-repo/rpm-package-repo-server)
