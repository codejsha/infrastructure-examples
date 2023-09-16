######################################################################

.\vcpkg version
.\vcpkg integrate install
.\vcpkg list

######################################################################

### install packages (windows)
.\vcpkg install vcpkg-cmake:x64-windows
.\vcpkg install vcpkg-cmake-get-vars:x64-windows
.\vcpkg install vcpkg-tool-ninja:x64-windows
.\vcpkg install pthreads:x64-windows
.\vcpkg install pthread:x64-windows

.\vcpkg install gsl:x64-windows
.\vcpkg install gtest:x64-windows
.\vcpkg install benchmark:x64-windows
.\vcpkg install fmt:x64-windows
.\vcpkg install boost-graph:x64-windows
.\vcpkg install abseil:x64-windows

.\vcpkg install librdkafka:x64-windows
.\vcpkg install avro-cpp:x64-windows

######################################################################

### install packages (linux)
./vcpkg install vcpkg-tool-ninja:x64-linux
./vcpkg install pthreads:x64-linux
./vcpkg install pthread:x64-linux
./vcpkg install gsl:x64-linux
./vcpkg install gtest:x64-linux
./vcpkg install benchmark:x64-linux
./vcpkg install fmt:x64-linux
./vcpkg install boost-graph:x64-linux
./vcpkg install abseil:x64-linux

./vcpkg install librdkafka
./vcpkg install avro-cpp

######################################################################

.\vcpkg remove $package
.\vcpkg search $package
.\vcpkg update
.\vcpkg upgrade

######################################################################
