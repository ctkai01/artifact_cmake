set(SKY_SOUL_PACKAGE_RELEASE "1.macos")
set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}_${OSQUERY_PACKAGE_RELEASE}_${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_SET_DESTDIR ON)

install(
  DIRECTORY
    "${SKY_SOUL_DATA_PATH}/sky_soul.app"

  DESTINATION
    "/opt/sky-soul/lib"

  USE_SOURCE_PERMISSIONS

  COMPONENT
    sky_soul
)

execute_process(
  COMMAND "${CMAKE_COMMAND}" -E create_symlink "/opt/sky-soul/lib/sky_soul.app/Contents/MacOS/sky_soul" sky_soul
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
)

# install(
#   FILES
#     "${CMAKE_CURRENT_BINARY_DIR}/sky_soul"
  
#   DESTINATION
#     "/usr/local/bin/"
  
#   COMPONENT
#     sky_soul
# )