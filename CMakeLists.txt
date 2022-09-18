cmake_minimum_required(VERSION 3.11 FATAL_ERROR)

include(cmake/common.cmake)
include(cmake/tidy.cmake)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")    # .a files
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")    # .so files
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")    # bin files
