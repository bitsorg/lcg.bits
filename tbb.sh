package: tbb
description: Intel Threading Building Blocks parallel programming library
version: "v2021.5.0"
tag: v2021.5.0
source: https://github.com/uxlfoundation/oneTBB
#version: "2022.2.0"
#tag: "2022.2.0"
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/tbb2022.2.0oss_src.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
license: Apache-2.0
prefer_system: .*
prefer_system_check: |
  printf "#include <tbb/concurrent_unordered_map.h>\n static_assert(TBB_INTERFACE_VERSION >= 11009, \"min version check failed\");\n" | c++ -std=c++20 -xc++ - -I$(brew --prefix tbb)/include -c -o /dev/null
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DTBB_TEST=OFF
}
