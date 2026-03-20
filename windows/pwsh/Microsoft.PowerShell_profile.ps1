[Console]::InputEncoding  = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding           = [System.Text.UTF8Encoding]::new($false)
$PSDefaultParameterValues['Out-File:Encoding']    = 'utf8'
$PSDefaultParameterValues['Set-Content:Encoding'] = 'utf8'
$PSDefaultParameterValues['Add-Content:Encoding'] = 'utf8'

$env:STARSHIP_CONFIG = "${HOME}/.config/starship/starship.toml"
Invoke-Expression (&starship init powershell)

$__CurrentPrompt = (Get-Command prompt -CommandType Function).ScriptBlock
function prompt {
  $p = ($PWD.Path -replace "^${HOME}", "~").TrimEnd('\','/')
  $Host.UI.RawUI.WindowTitle = ($p -split '[\\/]' | Select-Object -Last 1)
  & $__CurrentPrompt
}

function cddownloads { Set-Location "${HOME}/Downloads"; Get-ChildItem }
function cdrepos { Set-Location "${HOME}/source/repos"; Get-ChildItem }
function cdcoderepos { Set-Location "${HOME}/source/coderepos"; Get-ChildItem }
function cdsubrepos { Set-Location "${HOME}/source/subrepos"; Get-ChildItem }
function cddataworkspace { Set-Location "${HOME}/source/dataworkspace"; Get-ChildItem }
function cdworkrepos { Set-Location "${HOME}/source/workrepos"; Get-ChildItem }
function cdprops { Set-Location "${HOME}/properties"; Get-ChildItem }
function cdtools { Set-Location "${HOME}/tools"; Get-ChildItem }
