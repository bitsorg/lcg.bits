package: vgm
description: VGM (Virtual Geometry Model) detector geometry conversion
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/vgm-unknown.tar.gz
requires:
  - CMake
  - Geant4
  - ROOT
  - XercesC
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_GEANT4=ON \
    -DWITH_ROOT=ON \
    -DWITH_EXAMPLES=OFF \
    -DWITH_TEST=OFF
}
