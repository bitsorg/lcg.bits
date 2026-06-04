package: ildperformance
description: ILDPerformance ILC detector performance study package
version: "01.12.01"
tag: "v01-12-01"
source: https://github.com/iLCSoft/ILDPerformance.git
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
  - marlintrk
  - ROOT
  - GSL
  - clhep
  - generalbrokenlines
  - aidatt
  - DD4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
