package: fccanalyses
description: FCCAnalyses analysis framework for FCC experiments
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fccanalyses-HEAD.tar.gz
requires:
  - EDM4hep
  - k4fwcore
  - fastjet
  - eigen
  - DD4hep
  - delphes
  - vdt
  # optional:
  # - onnxruntime
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
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
    -DWITH_DD4HEP=ON
}
