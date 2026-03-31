######################################################################

zsh --no-rcs

######################################################################

### clear history
history -p

######################################################################

### title update
autoload -Uz add-zsh-hook
_update_title() { print -Pn "\e]0;%1~\a" }
add-zsh-hook precmd _update_title
add-zsh-hook chpwd _update_title

######################################################################

### full path using tilde

case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

######################################################################

### current directory name

case ${TERM} in
  xterm*)
    precmd () {print -Pn "\e]0;${PWD##*/}\a"}
    ;;
esac

case $TERM in
  xterm*)
    precmd () { print -Pn "\e]0;%1~\a" }
    ;;
esac

######################################################################

### current directory name using tilde

case ${TERM} in
  xterm*)
    precmd () {
        local DIR=${PWD/#$HOME/\~}
        print -Pn "\e]0;${DIR##*/}\a"
    }
    ;;
esac

######################################################################

### preexec/precmd

### preexec
preexec() {
  echo "preexec: ${1}"
}

### precmd
precmd() {
  echo "precmd: ${1}"
}

### starship_precmd_user_func
function blastoff(){
    echo "🚀"
}
starship_precmd_user_func="blastoff"
