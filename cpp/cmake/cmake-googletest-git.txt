######################################################################
### googletest (vcpkg)
######################################################################


include(FetchContent)
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG release-1.12.1
)
if(WIN32)
    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
endif(WIN32)
FetchContent_MakeAvailable(googletest)


######################################################################


enable_testing()
include(GoogleTest)

...
target_link_libraries(${name} PRIVATE gtest_main ${ARGN})
gtest_discover_tests(${name})


######################################################################


#include <gtest/gtest.h>
