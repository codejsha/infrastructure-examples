eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GPG_TTY="$(tty)"

# Added by Toolbox App
export PATH="${PATH}:${HOME}/Library/Application Support/JetBrains/Toolbox/scripts"

# node manager
eval "$(fnm env --use-on-cd --shell zsh)"

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# rust
source "${HOME}/.cargo/env"
