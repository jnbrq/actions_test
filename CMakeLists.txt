cmake_minimum_required(VERSION 3.12)

project(cxxdes)
set(CMAKE_CXX_STANDARD 20)

# library dependencies
include(FetchContent)

# fmt
FetchContent_Declare(fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG master)
FetchContent_MakeAvailable(fmt)

# googletest
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.12.1)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

include(GoogleTest)

add_library(libtest INTERFACE)
target_include_directories(
    libtest
    INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_library(libtest::libtest ALIAS libtest)

enable_testing()
add_executable("test1" "${CMAKE_CURRENT_SOURCE_DIR}/tests/test.cpp")
target_link_libraries(
    "test1"
    PRIVATE
    libtest::libtest
    GTest::gtest_main
    fmt::fmt-header-only)
gtest_discover_tests("test1")
