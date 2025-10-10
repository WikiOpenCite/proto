// SPDX-FileCopyrightText: 2025 The University of St Andrews
// SPDX-License-Identifier: GPL-3.0-or-later

#include <string>

#include "proto/proto.h"

#include <fmt/core.h>

exported_class::exported_class() : m_name{fmt::format("{}", "proto")} {}

auto exported_class::name() const -> char const* {
  return m_name.c_str();
}
