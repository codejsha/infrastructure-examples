# Windows

## Install PowerShell

### Homebrew

```sh
brew install --cask powershell
```

### Chocolatey

```ps1
choco install -y powershell-core

### install arguments
# --install-arguments='"ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1"'
# --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"'
# --install-arguments='"REGISTER_MANIFEST=1"'
# --install-arguments='"ENABLE_PSREMOTING=1"'
# --packageparameters '"/CleanUpPath"'
```

## Tools

### 7zip

```ps1
choco install -y 7zip.install
```

### Acrobat Reader

```ps1
choco install -y adobereader
```

### Bandizip

```ps1
choco install -y bandizip
```

### cURL

```ps1
choco install -y curl
```

### FileZilla

```ps1
choco install -y filezilla
```

### Firefox

```ps1
choco install -y firefox
```

### Google Chrome

```ps1
choco install -y googlechrome
```

### Hyper

```ps1
choco install -y hyper
```

### JetBrains Toolbox

```ps1
choco install -y jetbrainstoolbox
```

### Logitech Options+

```ps1
choco install -y logioptionsplus
```

### Miniconda

```ps1
choco install -y miniconda3 --params '"/InstallationType:JustMe"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1 /RegisterPython:1"'
```

### mkcert

```ps1
choco install -y mkcert
```

### MobaXterm

```ps1
choco install -y mobaxterm
```

### Notion

```ps1
choco install -y notion
```

### Obsidian

```ps1
choco install -y obsidian
```

### OpenSSH

```ps1
choco install -y openssh
```

### Microsoft Visual C++ Redistributable Package

```ps1
# choco install -y vcredist-all
choco install -y vcredist140   # 2015-2022
choco install -y vcredist2017
choco install -y vcredist2015
choco install -y vcredist2013
choco install -y vcredist2012
choco install -y vcredist2010
# choco install -y vcredist2008
# choco install -y vcredist2005
```

### PowerToys

```ps1
choco install -y powertoys
```

### Scala sbt

```ps1
choco install -y sbt
```

### Skaffold

```ps1
choco install -y skaffold
```

### Sourcetree

```ps1
choco install -y sourcetree
```

### Strawberry Perl

```ps1
choco install -y strawberryperl --install-arguments="INSTALLDIR=""C:\Progra~1\Strawberry"""
```

### Sysinternals

```ps1
choco install -y sysinternals
```

### TeamViewer

```ps1
choco install -y teamviewer
```

### Terraform

```ps1
choco install -y terraform
```

### TeX Live

```ps1
# choco install -y texlive
choco install -y texlive --params "'/InstallationPath:$env:USERPROFILE\tools\texlive'"
```

### VirtualBox

```ps1
choco install -y virtualbox
```

### Windows Terminal

```ps1
choco install -y microsoft-windows-terminal
```

### WinMerge

```ps1
choco install -y winmerge
```

### WinSCP

```ps1
choco install -y winscp
```

### Wireshark

```ps1
choco install -y wireshark
```
