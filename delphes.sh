package: delphes
description: Delphes fast detector response simulation framework
version: "3.5.1"
tag: "3.5.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/delphes-3.5.1.tar.gz
requires:
  - ROOT
  # optional:
  # - pythia8
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
    -DCMAKE_CXX_FLAGS=$CXXFLAGS
}
