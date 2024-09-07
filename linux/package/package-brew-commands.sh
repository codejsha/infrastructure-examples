######################################################################

### install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/prouser/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

sudo yum groupinstall 'Development Tools'
brew install gcc
