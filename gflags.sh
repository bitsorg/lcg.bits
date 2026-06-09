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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gflags registers its prefix in CMake's *user* package registry,
  # writing ~/.cmake/packages/gflags at install time. That path is outside the
  # build sandbox, so the install fails ("file cannot create directory"). The
  # registry is not needed (bits consumers find gflags via CMAKE_PREFIX_PATH),
  # so disable both registry registrations. No-op on Linux (Darwin-gated).
  _gflags_noreg=""
  [ "$(uname)" = Darwin ] && _gflags_noreg="-DREGISTER_INSTALL_PREFIX=OFF -DREGISTER_BUILD_PREFIX=OFF"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    ${_gflags_noreg} \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_gflags_LIB=ON
}
