######################################################################

### install
brew install kotlin
brew install ktlint

kotlin -version
kotlinc -version

######################################################################

### ktlint
ktlint -F
ktlint -F --editorconfig ../../.editorconfig "src/main/generated/**/*.kt"
