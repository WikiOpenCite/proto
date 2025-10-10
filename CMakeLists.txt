# SPDX-FileCopyrightText: 2025 https://github.com/friendlyanon
# SPDX-License-Identifier: Unlicense

cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    citescoop-proto
    VERSION 0.1.0
    DESCRIPTION "Protobuf definitions for citescoop data files"
    HOMEPAGE_URL "https://github.com/WikiOpenCite/citescoop"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    citescoop-proto_citescoop-proto
    src/proto.cc
)
add_library(wikiopencite::proto ALIAS citescoop-proto_citescoop-proto)

include(GenerateExportHeader)
generate_export_header(
    citescoop-proto_citescoop-proto
    BASE_NAME citescoop-proto
    EXPORT_FILE_NAME export/proto/proto_export.h
    CUSTOM_CONTENT_FROM_VARIABLE pragma_suppress_c4251
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(citescoop-proto_citescoop-proto PUBLIC CITESCOOP_PROTO_STATIC_DEFINE)
endif()

set_target_properties(
    citescoop-proto_citescoop-proto PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    VERSION "${PROJECT_VERSION}"
    SOVERSION "${PROJECT_VERSION_MAJOR}"
    EXPORT_NAME citescoop-proto
    OUTPUT_NAME citescoop-proto
)

target_include_directories(
    citescoop-proto_citescoop-proto ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_include_directories(
    citescoop-proto_citescoop-proto SYSTEM
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>"
)

target_compile_features(citescoop-proto_citescoop-proto PUBLIC cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(citescoop-proto_citescoop-proto PRIVATE fmt::fmt)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT citescoop-proto_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of citescoop-proto"
  )
endif()

include(cmake/dev-mode.cmake)
