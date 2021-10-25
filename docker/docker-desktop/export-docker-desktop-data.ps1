wsl --export docker-desktop-data "E:\Docker\wsl\data\docker-desktop-data.tar"
wsl --unregister docker-desktop-data
wsl --import docker-desktop-data "E:\Docker\wsl\data" "E:\Docker\wsl\data\docker-desktop-data.tar" --version 2
Remove-Item -Force E:\Docker\wsl\data\docker-desktop-data.tar
