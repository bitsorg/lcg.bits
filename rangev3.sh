package: rangev3
description: range-v3 library extending C++11/14 with ranges and views
version: "0.12.0"
tag: "0.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rangev3-0.12.0.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
      -DBUILD_TESTING=OFF \
      -DRANGE_V3_TESTS=OFF \
      -DRANGE_V3_DOCS=OFF \
      -DRANGE_V3_EXAMPLES=OFF \
      -DRANGE_V3_PERF=OFF
}
