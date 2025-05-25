######################################################################

### install

### homebrew
brew install cmake

### chocolatey
choco install -y cmake --installargs 'ADD_CMAKE_TO_PATH=System'

######################################################################

### toolchain

-DCMAKE_TOOLCHAIN_FILE=${HOME}/tools/vcpkg/scripts/buildsystems/vcpkg.cmake
