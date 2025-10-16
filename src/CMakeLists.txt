# SPDX-FileCopyrightText: 2025 https://github.com/friendlyanon
# SPDX-License-Identifier: Unlicense

add_library(
    citescoop-proto_citescoop-proto
    citation_group.proto
    citation.proto
    extracted_citation.proto
    identifiers.proto
    language.proto
    revision_citations.proto
    revision.proto
    revisions_group.proto
    url.proto
)

add_library(wikiopencite::proto ALIAS citescoop-proto_citescoop-proto)

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
    CXX_CLANG_TIDY ""
)

target_include_directories(
    citescoop-proto_citescoop-proto ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>"
)

target_compile_features(citescoop-proto_citescoop-proto PUBLIC cxx_std_20)

find_package(protobuf CONFIG REQUIRED)

protobuf_generate(
    TARGET citescoop-proto_citescoop-proto
    LANGUAGE cpp
)

target_link_libraries(citescoop-proto_citescoop-proto PUBLIC protobuf::libprotobuf)
