package: evtgen
description: EvtGen Monte Carlo generator for B/D meson decays
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/evtgen-<evtgen_1.7.0_tag>.tar.gz
requires:
  - CMake
  - pythia8
  - photos++
  - tauola++
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
patches:
  - evtgen-1.7.0.patch
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
    -DEVTGEN_PHOTOS=ON \
    -DPHOTOSPP_ROOT_DIR=${photos++_home} \
    -DEVTGEN_PYTHIA=ON \
    -DPYTHIA8_ROOT_DIR=${PYTHIA8_ROOT} \
    -DEVTGEN_TAUOLA=ON \
    -DTAUOLAPP_ROOT_DIR=${tauola++_home}
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} FLIBS=${FORTRAN_LIBRARY}
}
