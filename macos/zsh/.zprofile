eval "$(/opt/homebrew/bin/brew shellenv)"

export LANG=en_US.UTF-8
export GPG_TTY="$(tty)"

# Added by Toolbox App
export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"

# Node Version Manager
export NVM_DIR="${HOME}/.nvm"
[ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
