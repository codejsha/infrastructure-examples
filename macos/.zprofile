eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Toolbox App
export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"

# Node Version Manager
export NVM_DIR="${HOME}/.nvm"
[ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
