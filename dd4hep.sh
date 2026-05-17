package: DD4hep
description: Detector Description for HEP (generic detector description toolkit)
version: "master"
tag: "master"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/DD4hep-master.tar.gz
requires:
  - ROOT
  - XercesC
  - Boost
  - Python
  - pytest
  - LCIO
  - tbb
  # optional:
  # - assimp
  # - hepmc3
  # - EDM4hep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only
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
    -DBOOST_ROOT=${Boost_ROOT} \
    -DCMAKE_CXX_STANDARD=17 \
    -DDD4HEP_USE_XERCESC=ON \
    -DXERCESC_ROOT_DIR=${XercesC_ROOT} \
    -DROOTSYS=${ROOT_ROOT}
}
