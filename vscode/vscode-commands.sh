######################################################################

### install vscode

### homebrew
brew install --cask visual-studio-code

### chocolatey
choco install -y vscode

######################################################################

code --list-extensions
code --list-extensions --show-versions

code --list-extensions --profile Default
code --list-extensions --profile cpp
code --list-extensions --profile document
code --list-extensions --profile golang
code --list-extensions --profile java
code --list-extensions --profile kubernetes
code --list-extensions --profile python

code --install-extension <extension-id>
code --uninstall-extension <extension-id>

######################################################################

### the extension list for each profile:

### Default
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.remotehub
ms-vscode.remote-repositories
openai.chatgpt
pkief.material-icon-theme

### cpp
bierner.markdown-mermaid
bierner.markdown-preview-github-styles
davidanson.vscode-markdownlint
dineug.vuerd-vscode
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.remotehub
github.vscode-github-actions
github.vscode-pull-request-github
james-yu.latex-workshop
jebbs.plantuml
marp-team.marp-vscode
ms-vscode.remote-repositories
oijaz.unicode-latex
vscode-icons-team.vscode-icons
yzane.markdown-pdf
yzhang.markdown-all-in-one

### document
bierner.markdown-mermaid
bierner.markdown-preview-github-styles
DavidAnson.vscode-markdownlint
eamodio.gitlens
esbenp.prettier-vscode
GitHub.codespaces
GitHub.copilot
GitHub.copilot-labs
GitHub.remotehub
James-Yu.latex-workshop
mads-hartmann.bash-ide-vscode
marp-team.marp-vscode
ms-vscode.remote-repositories
oijaz.unicode-latex
quarto.quarto
vscode-icons-team.vscode-icons
yzhang.markdown-all-in-one

### golang
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.remotehub
golang.go
ms-vscode.remote-repositories
pkief.material-icon-theme

### java
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.remotehub
mathiasfrohlich.kotlin
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode-remote.vscode-remote-extensionpack
ms-vscode.remote-explorer
ms-vscode.remote-repositories
ms-vscode.remote-server
redhat.java
visualstudioexptteam.intellicode-api-usage-examples
visualstudioexptteam.vscodeintellicode
vmware.vscode-boot-dev-pack
vmware.vscode-spring-boot
vscjava.vscode-gradle
vscjava.vscode-java-debug
vscjava.vscode-java-dependency
vscjava.vscode-java-pack
vscjava.vscode-java-test
vscjava.vscode-maven
vscjava.vscode-spring-boot-dashboard
vscjava.vscode-spring-initializr
vscode-icons-team.vscode-icons

### kubernetes
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.copilot-labs
github.remotehub
ibm.output-colorizer
ms-azuretools.vscode-docker
ms-kubernetes-tools.vscode-kubernetes-tools
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode-remote.vscode-remote-extensionpack
ms-vscode.remote-explorer
ms-vscode.remote-repositories
ms-vscode.remote-server
redhat.vscode-yaml
vscode-icons-team.vscode-icons

### python
eamodio.gitlens
esbenp.prettier-vscode
github.codespaces
github.copilot
github.copilot-chat
github.copilot-labs
github.remotehub
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode-remote.vscode-remote-extensionpack
ms-vscode.remote-explorer
ms-vscode.remote-repositories
ms-vscode.remote-server
visualstudioexptteam.intellicode-api-usage-examples
visualstudioexptteam.vscodeintellicode
vscode-icons-team.vscode-icons

