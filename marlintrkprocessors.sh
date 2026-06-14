package: marlintrkprocessors
description: MarlinTrkProcessors track finding/fitting Marlin processors
version: "02.12.08"
tag: "v02-12-08"
source: https://github.com/iLCSoft/MarlinTrkProcessors.git
requires:
  - CMake
  - marlintrk
  - marlin
  - marlinutil
  - DD4hep
  - GSL
  - raida
  - ddkaltest
  - kitrack
  - kitrackmarlin
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
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
