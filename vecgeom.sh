package: VecGeom
description: Vectorized geometry library for particle-transport simulations
version: "master"
tag: "master"
source: https://gitlab.cern.ch/VecGeom/VecGeom.git
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
function Make() {
  # Build only library targets; GDML test executables share names with their
  # source subdirectories, so the linker fails with "Is a directory" on GCC 15.
  cmake --build . --target vecgeom --target vgdml ${JOBS:+-- -j$JOBS}
}
