package: k4reccalorimeter
description: k4reccalorimeter Key4hep framework package
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/k4reccalorimeter-HEAD.tar.gz
requires:
  - podio
  - EDM4hep
  - k4fwcore
  - DD4hep
  - k4geo
  - marlinutil
  - fastjet
  - k4simgeant4
  - ROOT
  - onnxruntime
  - simsipm
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=${ENABLE_IPO}
}
