project("sky_soul")
cmake_minimum_required(VERSION 3.17.5)

set(SKY_SOUL_DATA_PATH "" CACHE PATH "sky_soul package data")

if(SKY_SOUL_DATA_PATH STREQUAL "")
  message(FATAL_ERROR "Missing data folder")
endif()

if(NOT CPACK_GENERATOR)
  message(FATAL_ERROR "The CPACK_GENERATOR variable was not set")
endif()

if(SKY_SOUL_PACKAGE_VERSION STREQUAL "")
  message(FATAL_ERROR "The OSQUERY_PACKAGE_VERSION variable was not set")
endif()
set(CPACK_PACKAGE_VERSION "${SKY_SOUL_PACKAGE_VERSION}")

set(CPACK_PACKAGE_NAME "sky_soul")

string(TOLOWER "${CMAKE_SYSTEM_NAME}" platform_name)
message("${CMAKE_CURRENT_BINARY_DIR}")

if(platform_name STREQUAL "darwin")
  set(platform_name "macos")
endif()

include("platform/common.cmake")
include("platform/${platform_name}/common.cmake")

string(TOLOWER "${CPACK_GENERATOR}" generator_name)
include("platform/${platform_name}/${generator_name}.cmake")

include(CPack)

cpack_add_component("sky_soul"
  DISPLAY_NAME "Main binaries and tools"
  REQUIRED
)
