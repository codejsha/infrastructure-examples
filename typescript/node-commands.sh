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

### homebrew
brew install pnpm

######################################################################

nvm list

nvm install 20
