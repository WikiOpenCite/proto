# SPDX-FileCopyrightText: 2025 https://github.com/friendlyanon
# SPDX-License-Identifier: Unlicense

set(citescoop-proto_FOUND YES)

include(CMakeFindDependencyMacro)
# find_dependency(fmt)

if(citescoop-proto_FOUND)
  include("${CMAKE_CURRENT_LIST_DIR}/citescoop-protoTargets.cmake")
endif()
