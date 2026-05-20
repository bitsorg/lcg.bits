package: Gaudi
description: Gaudi software framework for HEP data processing applications
version: "master"
tag: "master"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Gaudi-master.tar.gz
requires:
  - CMake
  - Boost
  - Python
  - ROOT
  - clhep
  - AIDA
  - XercesC
  - rangev3
  - cppgsl
  - xenv
  - six
  - fmt
  - pytest
  - PyYAML
  - jsonmcpp
  - HepPDT
  - Catch2
  - networkx
  - pytest_cov
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
    -DCMAKE_FIND_FRAMEWORK=LAST \
    -DGAUDI_USE_DOXYGEN=OFF
}
