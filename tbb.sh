package: tbb
description: Intel Threading Building Blocks parallel programming library
version: "2022.2.0"
tag: "2022.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/oneTBB-2022.2.0.tar.gz
prefer_system: osx.*
prefer_system_check: |
  printf "#include <tbb/concurrent_unordered_map.h>\n static_assert(TBB_INTERFACE_VERSION >= 11009, \"min version check failed\");\n" | c++ -std=c++20 -xc++ - -I$(brew --prefix tbb)/include -c -o /dev/null

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -DTBB_TEST=OFF
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
