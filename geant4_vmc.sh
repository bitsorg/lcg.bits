package: geant4_vmc
description: Geant4 VMC (Virtual Monte Carlo) interface library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4_vmc-unknown.tar.gz
requires:
  - CMake
  - ROOT
  - Geant4
  - vgm
  - vmc
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
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
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGeant4VMC_BUILD_G4Root=ON \
    -DGeant4VMC_BUILD_G4Root_TEST=OFF \
    -DGeant4VMC_BUILD_Geant4VMC=ON \
    -DGeant4VMC_BUILD_EXAMPLES=OFF \
    -DGeant4VMC_USE_G4Root=ON \
    -DGeant4VMC_USE_VGM=ON \
    -DGeant4VMC_USE_GEANT4_UI=ON \
    -DGeant4VMC_USE_GEANT4_VIS=ON \
    -DGeant4VMC_USE_GEANT4_G3TOG4=OFF \
    -DGeant4VMC_INSTALL_EXAMPLES=OFF
}
