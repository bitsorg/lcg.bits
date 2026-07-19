package: gflags
description: Google gflags C++ command-line flag parsing library
version: "2.2.2"
source: https://github.com/gflags/gflags
tag: "v%(version)s"
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
  # gflags writes ~/.cmake/packages/gflags (the CMake user package registry) at
  # install time. In the build sandbox HOME is unset, so this resolves to
  # //.cmake/packages/gflags and the install fails ("cannot create directory").
  # The registry isn't needed (consumers find gflags via CMAKE_PREFIX_PATH), so
  # disable it on every platform (previously macOS-only, but el9/el10 hit the
  # same empty-HOME failure).
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DREGISTER_INSTALL_PREFIX=OFF \
    -DREGISTER_BUILD_DIR=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=ON \
    -DBUILD_gflags_LIB=ON
}
