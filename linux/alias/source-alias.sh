######################################################################

[ -f ~/.aliases/bash_aliases ] && source ~/.aliases/bash_aliases
[ -f ~/.aliases/docker_aliases ] && source ~/.aliases/docker_aliases
[ -f ~/.aliases/jdk_aliases ] && source ~/.aliases/jdk_aliases
# [ -f ~/.aliases/kafka_aliases ] && source ~/.aliases/kafka_aliases
[ -f ~/.aliases/kubectl_aliases ] && source ~/.aliases/kubectl_aliases
[ -f ~/.aliases/network_aliases ] && source ~/.aliases/network_aliases
[ -f ~/.aliases/location_aliases ] && source ~/.aliases/location_aliases
# [ -f ~/.aliases/location_aliases_git_bash ] && source ~/.aliases/location_aliases_git_bash
# [ -f ~/.aliases/location_aliases_wsl ] && source ~/.aliases/location_aliases_wsl
[ -f ~/.aliases/process_aliases ] && source ~/.aliases/process_aliases
[ -f ~/.aliases/python_aliases ] && source ~/.aliases/python_aliases
[ -f ${HOME}/.vault/root_token.txt ] && export VAULT_TOKEN="$(cat ${HOME}/.vault/root_token.txt)"
