package: collier
description: COLLIER one-loop tensor and scalar integral library
version: "1.2.8"
tag: "1.2.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/collier-1.2.8.tar.gz
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
  cmake \
    -Dstatic=OFF \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
}
function Make() {
  cmake --build . -j1
}
function MakeInstall() {
  cmake --install .
  # Second pass: static variant
  cmake $SOURCEDIR \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_BUILD_TYPE=Release \
    -Dstatic=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
  cmake --build . -j1
  cmake --install .
}
