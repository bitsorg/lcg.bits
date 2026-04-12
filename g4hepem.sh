package: g4hepem
description: g4hepem library/tool (from LCG software stack)
version: "20251114"
tag: "20251114"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/g4hepem-20251114.tar.gz
requires:
  - Geant4
  - cuda
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake $SOURCEDIR \
    -DG4HepEm_CUDA_BUILD=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_STANDARD=17 \
    -DG4HepEm_EARLY_TRACKING_EXIT=ON
}
