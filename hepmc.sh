package: HepMC
description: HepMC Monte Carlo event record (version 2)
version: "2.06.11"
tag: "2.06.11"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/HepMC-2.06.11.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
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
    -Dmomentum:STRING=MEV \
    -Dlength:STRING=MM
}
