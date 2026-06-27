package: Geant4-vecgeom-scalar
description: Geant4 build variant using VecGeom scalar geometry backend
version: "11.4.0"
mem_per_job: 1500
tag: "11.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4.%(version)s.tar.gz
requires:
  - CMake
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DGEANT4_USE_GDML=ON \
    -DXERCESC_ROOT_DIR="${XercesC_ROOT}" \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_G3TOG4=ON
}
