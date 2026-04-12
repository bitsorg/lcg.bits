package: Geant4-vecgeom-scalar
description: Geant4 build with VecGeom scalar geometry
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4.unknown.tar.gz
requires:
  - XercesC
  - VecGeom
  - expat
  - Python
  - Boost
  - clhep
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
    -DGEANT4_USE_GDML=ON \
    -DXERCESC_ROOT_DIR=${XercesC_ROOT} \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_G3TOG4=ON
}
