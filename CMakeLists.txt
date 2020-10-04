cmake_minimum_required(VERSION 3.16.0)

set(PROJECT_NAME $ENV{PROJECT_NAME})

project(${PROJECT_NAME}
  LANGUAGES C CXX Swift)

option(WITH_SWIFT_LOG "Enable logging through swift-log" NO)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_Swift_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/swift)

if(WITH_SWIFT_LOG)
  find_package(swift-log CONFIG QUIET)
endif()
find_package(dispatch CONFIG QUIET)
find_package(Foundation CONFIG QUIET)

add_subdirectory(Sources)

export(TARGETS ${PROJECT_NAME}
  FILE ${PROJECT_NAME}.cmake)
