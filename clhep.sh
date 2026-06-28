package: clhep
description: Class Library for High Energy Physics
version: "2.4.7.2"
tag: "2.4.7.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # TEMP (until bits-recipe-tools v0.0.32 is pinned): CLHEP's
  # clhep_ensure_out_of_source_build() FATALs if the binary dir is inside the
  # source tree. The deployed CMakeRecipe (v0.0.31) builds in bits-build/ INSIDE
  # the source copy, so redirect to a sibling dir OUTSIDE it. v0.0.32 does this in
  # the framework; drop this whole override then.
  BITS_CMAKE_BUILD="../build"
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="$INSTALLROOT" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"}
}
