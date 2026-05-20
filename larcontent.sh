package: larcontent
description: LArContent Pandora reconstruction algorithms for LAr-TPC
version: "04.11.02"
tag: "04.11.02"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/larcontent-04.11.02.tar.gz
requires:
  - CMake
  - pandorapfa
  - pandorasdk
  - pandoramonitoring
  - eigen
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DPANDORA_MONITORING=ON \
    -DCMAKE_MODULE_PATH="${PANDORAPFA_ROOT}/cmakemodules" \
    -DCMAKE_CXX_FLAGS="-Wno-error"
}
