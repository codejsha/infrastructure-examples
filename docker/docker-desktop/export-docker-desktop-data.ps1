### wsl --list --all
###     Windows Subsystem for Linux Distributions:
###     Ubuntu-22.04 (Default)
###     Ubuntu-20.04
###     docker-desktop-data
###     docker-desktop

$DataLocation = "E:\Docker\wsl\data"
wsl --export docker-desktop-data "$DataLocation\docker-desktop-data.tar"
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data "$DataLocation" "$DataLocation\docker-desktop-data.tar" --version 2
Remove-Item -Force $DataLocation\docker-desktop-data.tar
