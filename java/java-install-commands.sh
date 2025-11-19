######################################################################

### install jdk (apt)

### microsoft-openjdk
ubuntu_release=`lsb_release -rs`
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install msopenjdk-21
# sudo apt-get install msopenjdk-17
# sudo apt-get install msopenjdk-11

# sudo update-java-alternatives --set msopenjdk-21-amd64
# sudo update-java-alternatives --set msopenjdk-17-amd64
# sudo update-java-alternatives --set msopenjdk-11-amd64

######################################################################

### install jdk (homebrew)

### microsoft-openjdk
brew install --cask microsoft-openjdk
brew install --cask microsoft-openjdk@17
brew install --cask microsoft-openjdk@11

### temurin-openjdk
brew install --cask temurin
brew install --cask temurin@25
brew install --cask temurin@21
brew install --cask temurin@17
brew install --cask temurin@11
brew install --cask temurin@8

### corretto-openjdk
brew install --cask corretto
brew install --cask corretto@25
brew install --cask corretto@21
brew install --cask corretto@17
brew install --cask corretto@11
brew install --cask corretto@8

### openjdk
brew install openjdk
brew install openjdk@25
brew install openjdk@21
brew install openjdk@17
brew install openjdk@11
brew install openjdk@8

### listing installed java versions in macos
/usr/libexec/java_home -V

######################################################################

### install jdk (chocolatey)

### microsoft-openjdk
choco install -y microsoft-openjdk
choco install -y microsoft-openjdk17
choco install -y microsoft-openjdk11

### temurin-openjdk
choco install -y temurin
choco install -y temurin21
choco install -y temurin17
choco install -y temurin11
choco install -y temurin8

### corretto-openjdk
choco install -y correttojdk
choco install -y corretto21jdk
choco install -y corretto17jdk
choco install -y corretto11jdk
choco install -y corretto8jdk

### openjdk
choco install -y openjdk
