package: collier
description: COLLIER one-loop tensor and scalar integral library
version: "1.2.8"
tag: "1.2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Dstatic=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  cmake --build "$BITS_CMAKE_BUILD" -j1
}
function MakeInstall() {
  cmake --install "$BITS_CMAKE_BUILD"
  # Second pass: static variant
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" \
    -DCMAKE_BUILD_TYPE=Release \
    -Dstatic=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  cmake --build "$BITS_CMAKE_BUILD" -j1
  cmake --install "$BITS_CMAKE_BUILD"
}
