# Windows

## Install PowerShell

### Homebrew

```sh
brew install --cask powershell

# brew uninstall --cask powershell
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

# choco uninstall -y powershell-core
```

## Tools

### 7zip

```ps1
choco install -y 7zip.install

# choco uninstall -y 7zip.install
```

### Acrobat Reader

```ps1
choco install -y adobereader

# choco uninstall -y adobereader
```

### Bandizip

```ps1
choco install -y bandizip

# choco uninstall -y bandizip
```

### cURL

```ps1
choco install -y curl

# choco uninstall -y curl
```

### FileZilla

```ps1
choco install -y filezilla

# choco uninstall -y filezilla
```

### Firefox

```ps1
choco install -y firefox

# choco uninstall -y firefox
```

### GitKraken

```ps1
choco install -y gitkraken

# choco uninstall -y gitkraken
```

### Google Chrome

```ps1
choco install -y googlechrome

# choco uninstall -y googlechrome
```

### Hyper

```ps1
choco install -y hyper

# choco uninstall -yhyper
```

### JetBrains Toolbox

```ps1
choco install -y jetbrainstoolbox

# choco uninstall -y jetbrainstoolbox
```

### jq

```ps1
choco install -y jq

# choco uninstall -y jq
```

### Logitech Options+

```ps1
choco install -y logioptionsplus

# choco uninstall -y logioptionsplus
```

### Miniconda

```ps1
choco install -y miniconda3 --params '"/InstallationType:JustMe"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1 /RegisterPython:1"'

# choco uninstall miniconda3
```

### mkcert

```ps1
choco install -y mkcert

# choco uninstall -y mkcert
```

### MobaXterm

```ps1
choco install -y mobaxterm

# choco uninstall -y mobaxterm
```

### Notion

```ps1
choco install -y notion

# choco uninstall -y notion
```

### Obsidian

```ps1
choco install -y obsidian

# choco uninstall -y obsidian
```

### OpenSSH

```ps1
choco install -y openssh

# choco uninstall -y openssh
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

# choco uninstall -y vcredist-all
# choco uninstall -y vcredist140   # 2015-2022
# choco uninstall -y vcredist2017
# choco uninstall -y vcredist2015
# choco uninstall -y vcredist2013
# choco uninstall -y vcredist2012
# choco uninstall -y vcredist2010
# choco uninstall -y vcredist2008
# choco uninstall -y vcredist2005
```

### PowerToys

```ps1
choco install -y powertoys

# choco uninstall -y powertoys
```

### Scala sbt

```ps1
choco install -y sbt

# choco uninstall -y sbt
```

### Skaffold

```ps1
choco install -y skaffold

# choco uninstall -y skaffold
```

### Sourcetree

```ps1
choco install -y sourcetree

# choco uninstall -y sourcetree
```

### Strawberry Perl

```ps1
choco install -y strawberryperl --install-arguments="INSTALLDIR=""C:\Progra~1\Strawberry"""

# choco uninstall -y strawberryperl --install-arguments="INSTALLDIR=""C:\Progra~1\Strawberry"""
```

### Sysinternals

```ps1
choco install -y sysinternals

# choco uninstall -y sysinternals
```

### TeamViewer

```ps1
choco install -y teamviewer

# choco uninstall -y teamviewer
```

### Terraform

```ps1
choco install -y terraform

# choco uninstall -y terraform
```

### TeX Live

```ps1
# choco install -y texlive
choco install -y texlive --params "'/InstallationPath:$env:USERPROFILE\tools\texlive'"

# choco uninstall -y texlive
```

### VirtualBox

```ps1
choco install -y virtualbox

# choco uninstall -y virtualbox
```

### Windows Terminal

```ps1
choco install -y microsoft-windows-terminal

# choco uninstall -y microsoft-windows-terminal
```

### WinMerge

```ps1
choco install -y winmerge

# choco uninstall -y winmerge
```

### WinSCP

```ps1
choco install -y winscp

# choco uninstall -y winscp
```

### Wireshark

```ps1
choco install -y wireshark

# choco uninstall -y wireshark
```
