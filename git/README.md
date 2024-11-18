# Git

## Install

### DNF/YUM

```bash
sudo dnf install -y git

sudo yum install -y git
```

### Build

```bash
bash ./install-git.sh
```

### Chocolatey

```ps1
choco install -y git.install --package-parameters="/NoShellIntegration"

### package parameters
###
### /GitOnlyOnPath
### /GitAndUnixToolsOnPath
### /NoAutoCrlf
### /WindowsTerminal
### /NoShellIntegration
### /NoGuiHereIntegration
### /NoShellHereIntegration
### /NoCredentialManager
### /NoGitLfs
### /SChannel
### /NoOpenSSH
### /WindowsTerminalProfile
### /Symlinks
### /DefaultBranchName:default_branch_name
### /Editor:Nano|VIM|Notepad++|VisualStudioCode|VisualStudioCodeInsiders|SublimeText|Atom|VSCodium|Notepad|Wordpad|Custom editor path
```

## Git Flow

Git flow is a Git branching strategy which designed to simplify release management. In the Git Flow, there are five branch types:

```txt
main: production-ready code

develop: latest delivered development changes for the next release

feature: new feature development

release: prepare for a new production release

hotfix: fix a bug in production code
```

- [A successful Git branching model by Vincent Driessen](https://nvie.com/posts/a-successful-git-branching-model/)
- [What is Git Flow - GitKraken](https://www.gitkraken.com/learn/git/git-flow)
- [Gitflow - GitKraken](https://help.gitkraken.com/gitkraken-client/git-flow/)

### Install Git flow AVH edition

:warning: NOTE: deprecated

```sh
# Homebrew
brew install git-flow-avh
```

## Commit messages

commit type examples:

```txt
feat: add new feature

fix: fix a bug

docs: changes to the documentation like readme

style: style or formatting change

refactor: restructure function to be more modular

chore: update build tasks, package manager configs, etc

test: test a feature
```

## Best practices

- [What is the best Git branch strategy? - GitKraken](https://www.gitkraken.com/learn/git/best-practices/git-branch-strategy)
- [Writing a Good Git Commit Message - GitKraken](https://www.gitkraken.com/learn/git/best-practices/git-commit-message)

## Other Tools

### git-extras

```sh
# Homebrew
brew install git-extras
```

### Gitify

```sh
# Homebrew
brew install --cask gitify
```
