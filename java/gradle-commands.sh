######################################################################

### install gradle

### homebrew
brew install gradle

### chocolatey
choco install -y gradle

######################################################################

### build project
gradle build
sh gradlew build --info

######################################################################

### update gradle wrapper
gradle wrapper --gradle-version 9.7.1
./gradlew wrapper

