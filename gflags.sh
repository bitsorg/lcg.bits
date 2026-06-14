package: gflags
description: Google gflags C++ command-line flag parsing library
version: "2.2.2"
tag: "2.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gflags writes ~/.cmake/packages/gflags (user package registry) at
  # install, outside the sandbox, so install fails. The registry isn't needed
  # (consumers find gflags via CMAKE_PREFIX_PATH), so disable both registrations.
  _gflags_noreg=""
  bits_is_macos && _gflags_noreg="-DREGISTER_INSTALL_PREFIX=OFF -DREGISTER_BUILD_PREFIX=OFF"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    ${_gflags_noreg} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_gflags_LIB=ON
}
