######################################################################

$PSVersionTable.PSVersion

######################################################################

### install powershell

### homebrew
brew install --cask powershell

### chocolatey
choco install -y powershell-core
### install arguments
# --install-arguments='"ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1"'
# --install-arguments='"ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1"'
# --install-arguments='"REGISTER_MANIFEST=1"'
# --install-arguments='"ENABLE_PSREMOTING=1"'
# --packageparameters '"/CleanUpPath"'

######################################################################

Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
