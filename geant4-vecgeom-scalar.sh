package: Geant4-vecgeom-scalar
description: Geant4 build variant using VecGeom scalar geometry backend
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
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-Geant4
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
    -DGEANT4_USE_GDML=ON \
    -DXERCESC_ROOT_DIR=${XercesC_ROOT} \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_G3TOG4=ON
}
