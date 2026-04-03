### shell integration
export ZSH_COMPDUMP="${HOME}/.cache/zcompdump/zcompdump-${ZSH_VERSION}"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
setopt HIST_IGNORE_ALL_DUPS
FPATH=${HOMEBREW_PREFIX}/share/zsh-completions:${FPATH}
autoload -Uz compinit
compinit -C
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
source ${HOMEBREW_PREFIX}/opt/git-extras/share/git-extras/git-extras-completion.zsh
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${HOME}/tools/zsh-plugins/load-zsh-plugins.sh

autoload -Uz add-zsh-hook
_update_title() { print -Pn "\e]0;%1~\a" }
add-zsh-hook precmd _update_title
add-zsh-hook chpwd _update_title

export LS_COLORS="di=36:ln=38;5;210:or=31:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export ZSH_HIGHLIGHT_STYLES[path]='bg=#1e1e1e'
export ZSH_HIGHLIGHT_STYLES[path_prefix]='bg=#1e1e1e'

### variables
export PATH="${HOMEBREW_PREFIX}/opt/curl/bin:${PATH}"
export PATH="${HOMEBREW_PREFIX}/opt/llvm/bin:${PATH}"
export PATH="${HOME}/go/bin:${PATH}"
export PATH="${HOME}/Library/pnpm:${PATH}"
export PATH="${HOME}/.krew/bin:${PATH}"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-25.jdk/Contents/Home"
export GROOVY_HOME="${HOMEBREW_PREFIX}/opt/groovysdk/libexec"
export VCPKG_ROOT="${HOME}/tools/vcpkg"

### aliases
alias ls="lsd"
alias ll="lsd -alh"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias cat="bat --style=header --paging=never"
alias eza="eza -alg --icons --time-style=long-iso"
alias fl="open -b com.binarynights.forklift-setapp"
alias mysql="${HOMEBREW_PREFIX}/opt/mysql-client@8.4/bin/mysql"
alias mysqldump="${HOMEBREW_PREFIX}/opt/mysql-client@8.4/bin/mysqldump"
alias psql="${HOMEBREW_PREFIX}/opt/postgresql@18/bin/psql"
