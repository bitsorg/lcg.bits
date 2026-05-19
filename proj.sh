package: proj
description: PROJ cartographic projections and coordinate transformations
version: "9.6.0"
tag: "9.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/proj-9.6.0.tar.gz
requires:
  - CMake
  - sqlite
  - pkg_config
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
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
    -DBUILD_SHARED_LIBS=ON
}