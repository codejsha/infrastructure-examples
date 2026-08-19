######################################################################

### install act

### homebrew
brew install act

### chocolatey
choco install -y act-cli

######################################################################

### github cli extension
gh extension install https://github.com/nektos/gh-act

######################################################################

act -l

act -W .\.github\workflows\cmake.yml
act -W .\.github\workflows\gradle.yml
act -W .\.github\workflows\python.yml

act -v -W .\.github\workflows\cmake.yml
act -v -W .\.github\workflows\gradle.yml
act -v -W .\.github\workflows\python.yml
