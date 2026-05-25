package: VecGeom
description: Vectorized geometry library for particle-transport simulations
version: "master"
tag: "master"
source: https://gitlab.cern.ch/VecGeom/VecGeom.git
#sources:
#  - https://lcgpackages.web.cern.ch/tarFiles/sources/VecGeom-vHEAD.tar.gz
requires:
  - CMake
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DVECGEOM_GEANT4=OFF \
    -DVECGEOM_ROOT=OFF \
    -DVECGEOM_BUILTIN_VECCORE=OFF \
    -DVECGEOM_NAV=tuple \
    -DVECGEOM_NAVTUPLE_MAXDEPTH=4 \
    -DVECGEOM_USE_SURF=ON
}
