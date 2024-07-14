# Python

## Install Python

### Build

```bash
bash ./install-python.sh
```

### Homebrew

```sh
brew install python@3.11

# brew uninstall python@3.11
```

### Chocolatey

```ps1
# choco install -y python3
choco install -y python311 --params "'/InstallDir:$env:USERPROFILE\tools\python3'"
# choco install -y python2 --params "'/InstallDir:$env:USERPROFILE\tools\python2'"

# choco uninstall -y python3
# choco uninstall -y python311
# choco uninstall -y python2
```

## Install Poetry

### Homebrew

```sh
brew install poetry

# brew uninstall poetry
```

## Install Anaconda

### Homebrew

```sh
brew install --cask anaconda

# brew uninstall --cask anaconda
```

### Chocolatey

```ps1
choco install -y anaconda3 --params '"/JustMe"'
# choco install -y anaconda3 --params '"/JustMe /AddToPath"'
# choco install -y anaconda3 --params '"/AddToPath /D:C:\Program Files"'

# choco uninstall -y anaconda3
```
