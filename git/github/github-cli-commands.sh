######################################################################

### bash completion
eval "$(gh completion --shell bash)"

######################################################################

### install github cli (gh)

### homebrew
brew install gh

### chocolatey
choco install -y gh

### dnf/yum
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

### apt
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

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

gh repo list
gh repo list example-corp

gh repo create
gh repo create --private
gh repo create --public
gh repo view

gh repo clone example-corp/helloworld

######################################################################

### secret

gh secret list --repo example-corp/helloworld --env dev
gh secret list --repo example-corp/helloworld --env prod

######################################################################

### workflow

gh workflow list

gh workflow run link-check.yml
gh workflow run link-check.yml --ref develop

gh workflow run cmake.yml
gh workflow run uv.yml --ref main
gh workflow run go.yml --ref develop
gh workflow run gradle.yml

### run
gh run list --workflow="ci-prod.yaml"
gh run list --workflow="ci-prod.yaml" --limit 5
gh run list --repo example-corp/helloworld --workflow="ci-prod.yaml"
gh run list --repo example-corp/helloworld --workflow="ci-prod.yaml"

######################################################################

### install github desktop

### homebrew
brew install --cask github

### chocolatey
choco install -y github-desktop
