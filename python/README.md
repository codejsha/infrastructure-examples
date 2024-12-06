# Python

## Install Python

### Build

```bash
bash ./install-python.sh
```

### Homebrew

```sh
brew install python@3.11
```

### Chocolatey

```ps1
# choco install -y python3
choco install -y python311 --params "'/InstallDir:$env:USERPROFILE\tools\python3'"
# choco install -y python2 --params "'/InstallDir:$env:USERPROFILE\tools\python2'"
```

## Install virtualenv

### Homebrew

```sh
brew install virtualenv
```

## Install Poetry

### Homebrew

```sh
brew install poetry
```

## Install Anaconda

### Homebrew

```sh
brew install --cask anaconda
```

### Chocolatey

```ps1
choco install -y anaconda3 --params '"/JustMe"'
# choco install -y anaconda3 --params '"/JustMe /AddToPath"'
# choco install -y anaconda3 --params '"/AddToPath /D:C:\Program Files"'
```
