# SPDX-FileCopyrightText: 2025 https://github.com/friendlyanon
# SPDX-License-Identifier: Unlicense

if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/citescoop-proto-${PROJECT_VERSION}"
      CACHE STRING ""
  )
  set_property(CACHE CMAKE_INSTALL_INCLUDEDIR PROPERTY TYPE PATH)
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
# should match the name of variable set in the install-config.cmake script
set(package citescoop-proto)

install(
    DIRECTORY
    "${PROJECT_BINARY_DIR}/src/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT citescoop-proto_Development
)

install(
    TARGETS citescoop-proto_citescoop-proto
    EXPORT citescoop-protoTargets
    RUNTIME #
    COMPONENT citescoop-proto_Runtime
    LIBRARY #
    COMPONENT citescoop-proto_Runtime
    NAMELINK_COMPONENT citescoop-proto_Development
    ARCHIVE #
    COMPONENT citescoop-proto_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    citescoop-proto_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE STRING "CMake package config location relative to the install prefix"
)
set_property(CACHE citescoop-proto_INSTALL_CMAKEDIR PROPERTY TYPE PATH)
mark_as_advanced(citescoop-proto_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${citescoop-proto_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT citescoop-proto_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${citescoop-proto_INSTALL_CMAKEDIR}"
    COMPONENT citescoop-proto_Development
)

install(
    EXPORT citescoop-protoTargets
    NAMESPACE wikiopencite::
    DESTINATION "${citescoop-proto_INSTALL_CMAKEDIR}"
    COMPONENT citescoop-proto_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
