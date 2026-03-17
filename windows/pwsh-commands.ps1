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

######################################################################

### full path in window title
$__CurrentPrompt = (Get-Command prompt -CommandType Function).ScriptBlock
function prompt {
  $Host.UI.RawUI.WindowTitle = ($PWD.Path -replace "^${HOME}", "~")
  & $__CurrentPrompt
}

### current directory name only
$__CurrentPrompt = (Get-Command prompt -CommandType Function).ScriptBlock
function prompt {
  $p = ($PWD.Path -replace "^${HOME}", "~").TrimEnd('\','/')
  $Host.UI.RawUI.WindowTitle = ($p -split '[\\/]' | Select-Object -Last 1)
  & $__CurrentPrompt
}
