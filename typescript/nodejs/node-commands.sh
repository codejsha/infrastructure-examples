######################################################################

### install node.js using nvm

### linux/macos

### installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
### download and install Node.js (you may need to restart the terminal)
nvm install 20

### windows

### installs fnm (Fast Node Manager)
winget install Schniz.fnm
### download and install Node.js
fnm use --install-if-missing 20

######################################################################

### install pnpm
brew install pnpm

######################################################################

### manage node versions

nvm ls-remote --lts

nvm ls

nvm install 24
nvm uninstall 20
nvm alias default 24

nvm use 24
nvm current
nvm deactivate

######################################################################

### reinstall global packages

nvm use 20
npm ls -g --depth=0

nvm use 24
nvm reinstall-packages 20
