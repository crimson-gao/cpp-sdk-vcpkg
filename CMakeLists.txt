cmake_minimum_required(VERSION 3.10)
set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" CACHE STRING "")
project(HelloWorld)

find_package(aliyun_log CONFIG REQUIRED)  # Add this line

add_executable(example example.cpp)
target_link_libraries(example PRIVATE aliyun_log::aliyun_log)  # Add this line