######################################################################

### install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/prouser/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo yum groupinstall 'Development Tools'
brew install gcc

######################################################################

brew install <package_name>
brew upgrade <package_name>
brew uninstall <package_name>

brew update && brew outdated
brew upgrade && brew cleanup

######################################################################

brew list
brew list --versions protoc-gen-go
brew list --versions protoc-gen-go-grpc
brew list --versions protoc-gen-grpc-java

brew search <package_name>
brew info <package_name>

######################################################################

### manually remove any leftover files
brew cleanup
brew list --cask | grep <package_name>
ls -l /opt/homebrew/Caskroom/<package_name>
rm -rf /opt/homebrew/Caskroom/<package_name>
