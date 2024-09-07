# Installing PowerShell Core on Linux

## dotnet global tool

If you already have the .NET Core SDK installed, it’s easy to install PowerShell as a .NET Global tool.

```bash
dotnet tool install --global PowerShell
```

## Installation via Package Repository (preferred)

```bash
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
sudo yum install -y powershell
```

## Uninstallation

```bash
sudo yum remove powershell
```
