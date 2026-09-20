typeset -U path PATH

path=(
  "${HOME}/.local/bin"
  "${HOME}/.krew/bin"
  "${HOME}/.cargo/bin"
  "${HOME}/tools/bin"
  "${HOME}/go/bin"
  "${HOME}/Library/pnpm/bin"
  "/opt/homebrew/opt/curl/bin"
  "/opt/homebrew/opt/llvm/bin"
  $path
)
export PATH

export LANG="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_STATE_HOME="${HOME}/.local/state"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-25.jdk/Contents/Home"
export GROOVY_HOME="/opt/homebrew/opt/groovysdk/libexec"
export VCPKG_ROOT="${HOME}/tools/vcpkg"
export PNPM_HOME="${HOME}/Library/pnpm"

