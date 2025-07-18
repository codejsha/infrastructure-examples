######################################################################

### install spring boot cli

### homebrew
brew tap spring-io/tap
brew install spring-boot

### chocolatey
choco install -y spring-boot-cli

######################################################################

spring help init

### view supported dependencies, project types, parameters
spring init --list

######################################################################

spring init --dependencies=web --java-version=21 demo
spring init --dependencies=web,data-jpa demo

spring init --name=demo --artifactId=demo --dependencies=web,lombok demo
spring init --group-id com.example --artifact-id demo --name demo --package-name com.example.demo --version 0.0.1-SNAPSHOT --boot-version 3.3.0 --language java --java-version 21 --dependencies web,data-jpa, demo
