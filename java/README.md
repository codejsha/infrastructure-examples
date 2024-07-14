# Java

Java is a high-level, object-oriented programming language that is designed to be platform-independent.

- Java Development Kit (JDK): The JDK is a software development kit (SDK) that provides the necessary tools and libraries to develop, test, and deploy Java applications. It includes the Java Runtime Environment (JRE), the Java Compiler, and other utilities.
- Java Runtime Environment (JRE): The JRE is a software package that is responsible for running Java programs. It includes the Java Virtual Machine (JVM), other libraries and components that are necessary to run Java applications. It is a subset of the JDK.
- Java Virtual Machine (JVM): The JVM is a software implementation of a computer that runs Java bytecode, providing a runtime environment for Java programs.

## Install

### APT

```bash
# microsoft-openjdk
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
```

### Binary/Archive

```bash
bash ./install-oracle-jdk.sh
```

### Homebrew

```sh
# microsoft-openjdk
brew install --cask microsoft-openjdk
brew install --cask microsoft-openjdk@17
brew install --cask microsoft-openjdk@11

# temurin-openjdk
brew install --cask temurin
brew install --cask temurin@21
brew install --cask temurin@17
brew install --cask temurin@11
brew install --cask temurin@8

# corretto-openjdk
brew install --cask corretto
brew install --cask corretto@21
brew install --cask corretto@17
brew install --cask corretto@11
brew install --cask corretto@8

# openjdk
brew install openjdk
brew install openjdk@21
brew install openjdk@17
brew install openjdk@11
brew install openjdk@8
```

### Chocolatey

```ps1
# microsoft-openjdk
choco install -y microsoft-openjdk
choco install -y microsoft-openjdk17
choco install -y microsoft-openjdk11

# temurin-openjdk
choco install -y temurin
choco install -y temurin21
choco install -y temurin17
choco install -y temurin11
choco install -y temurin8

# corretto-openjdk
choco install -y correttojdk
choco install -y corretto21jdk
choco install -y corretto17jdk
choco install -y corretto11jdk
choco install -y corretto8jdk

# openjdk
choco install -y openjdk
```
