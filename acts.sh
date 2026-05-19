package: acts
description: ACTS track reconstruction framework for HEP experiments
version: "46.5.0"
tag: "46.5.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/acts-46.5.0.tar.gz
requires:
  - CMake
  - Boost
  - eigen
  - ROOT
  - DD4hep
  - sympy
  - particle
  - hatchling
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
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
    -DACTS_BUILD_PLUGIN_IDENTIFICATION=ON \
    -DACTS_BUILD_PLUGIN_DIGITIZATION=ON \
    -DACTS_BUILD_PLUGIN_DD4HEP=ON \
    -DACTS_BUILD_PLUGIN_JSON=ON \
    -DACTS_BUILD_PLUGIN_TGEO=ON \
    -DACTS_BUILD_UNITTESTS=OFF \
    -DACTS_USE_SYSTEM_LIBS=ON \
    -DCMAKE_CXX_FLAGS="-I${XercesC_ROOT}/include -I${eigen_ROOT}/include/eigen3"
}
