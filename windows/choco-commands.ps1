######################################################################

choco install -y $package

choco uninstall -y $package

choco list --local-only

choco upgrade --confirm all

######################################################################

### install tools

### 7zip
choco install -y 7zip.install

### acrobat reader
choco install -y adobereader

### bandizip
choco install -y bandizip

### curl
choco install -y curl

### filezilla
choco install -y filezilla

### firefox
choco install -y firefox

### google chrome
choco install -y googlechrome

### hyper
choco install -y hyper

### jetbrains toolbox
choco install -y jetbrainstoolbox

### logitech options+
choco install -y logioptionsplus

### miniconda
choco install -y miniconda3 --params '"/InstallationType:JustMe"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1"'
# choco install -y miniconda3 --params '"/InstallationType:JustMe /AddToPath:1 /RegisterPython:1"'

### mkcert
choco install -y mkcert

### mobaxterm
choco install -y mobaxterm

### notion
choco install -y notion

### obsidian
choco install -y obsidian

### openssh
choco install -y openssh

### microsoft visual c++ redistributable package
# choco install -y vcredist-all
choco install -y vcredist140   # 2015-2022
choco install -y vcredist2017
choco install -y vcredist2015
choco install -y vcredist2013
choco install -y vcredist2012
choco install -y vcredist2010
# choco install -y vcredist2008
# choco install -y vcredist2005

### powertoys
choco install -y powertoys

### scala sbt
choco install -y sbt

### skaffold
choco install -y skaffold

### sourcetree
choco install -y sourcetree

### strawberry perl
choco install -y strawberryperl --install-arguments="INSTALLDIR=""C:\Progra~1\Strawberry"""

### sysinternals
choco install -y sysinternals

### teamviewer
choco install -y teamviewer

### terraform
choco install -y terraform

### tex live
# choco install -y texlive
choco install -y texlive --params "'/InstallationPath:$env:USERPROFILE\tools\texlive'"

### virtualbox
choco install -y virtualbox

### windows terminal
choco install -y microsoft-windows-terminal

### winmerge
choco install -y winmerge

### winscp
choco install -y winscp

### wireshark
choco install -y wireshark
