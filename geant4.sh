package: Geant4
description: Geant4 Monte Carlo particle transport simulation toolkit
version: "11.4.1"
tag: "11.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4.11.4.1).tar.gz
requires:
  - XercesC
  - expat
  - Python
  - Boost
  - clhep
build_requires:
  - bits-recipe-tools
license: LicenseRef-Geant4
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
    -DGEANT4_USE_GDML=ON \
    -DXERCESC_ROOT_DIR=${XercesC_ROOT} \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_G3TOG4=ON
}
