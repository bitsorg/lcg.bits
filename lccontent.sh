package: lccontent
description: LCContent Pandora reconstruction algorithms for linear colliders
version: "03.02.00"
tag: "03.02.00"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/lccontent-03.02.00.tar.gz
requires:
  - CMake
  - pandorapfa
  - pandorasdk
  - pandoramonitoring
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
    -DPANDORA_MONITORING=ON \
    -DCMAKE_MODULE_PATH=${PANDORAPFA_ROOT}/cmakemodules \
    -DCMAKE_CXX_FLAGS="-Wno-error"
}
