######################################################################
### googletest (vcpkg)
######################################################################


find_package(GTest CONFIG REQUIRED)


######################################################################


find_package(GTest REQUIRED)

...
target_link_libraries(${name} PRIVATE GTest::gtest ${ARGN})
gtest_discover_tests(${name})


######################################################################


#include <gtest/gtest.h>
