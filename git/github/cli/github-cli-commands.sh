######################################################################

### bash completion
eval "$(gh completion --shell bash)"

######################################################################

### login/logout

gh auth login

gh config get git_protocol
gh config set git_protocol ssh
gh config set git_protocol https

gh auth logout
gh auth status

######################################################################

### repo

gh repo create
gh repo create --private
gh repo create --public
gh repo view

gh repo clone codejsha/infrastructure-examples
