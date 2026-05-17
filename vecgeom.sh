package: VecGeom
description: Vectorized geometry library for particle-transport simulations
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecGeom-vHEAD.tar.gz
requires:
  - Vc
  - veccore
  - XercesC
  # optional:
  # - cuda
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
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DVECGEOM_GEANT4=OFF \
    -DVECGEOM_ROOT=OFF \
    -DVECGEOM_BUILTIN_VECCORE=OFF \
    -DVECGEOM_NAV=tuple \
    -DVECGEOM_NAVTUPLE_MAXDEPTH=4 \
    -DVECGEOM_USE_SURF=ON
}
