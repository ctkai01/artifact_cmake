set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_COMMAND_PRODUCTBUILD "${OSQUERY_DATA_PATH}/productbuild.sh")
set(CPACK_COMMAND_PKGBUILD "${CPACK_COMMAND_PRODUCTBUILD}")

# cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#   -DCPACK_GENERATOR=productbuild \
#   -DOSQUERY_PACKAGE_VERSION=${OSQUERY_VERSION} \
#   -DOSQUERY_DATA_PATH=${DESTDIR} \
#   ../../

# cmake --build . --target package