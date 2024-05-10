cmake_minimum_required(VERSION 3.1)
project(awesome_app CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

find_package(awesome_library REQUIRED)

add_executable(awesome_app main.cpp)
target_link_libraries(awesome_app awesome_library::awesome_library)
