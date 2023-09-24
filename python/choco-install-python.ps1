# choco install --confirm python3
choco install --confirm python311 --params "'/InstallDir:$env:USERPROFILE\tools\python3'"
choco install --confirm python2 --params "'/InstallDir:$env:USERPROFILE\tools\python2'"

# choco uninstall --confirm python3
# choco uninstall --confirm python311
# choco uninstall --confirm python2
