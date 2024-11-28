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
