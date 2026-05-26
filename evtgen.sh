package: evtgen
description: EvtGen Monte Carlo generator for B/D meson decays
version: "1.7.0"
tag: "1.7.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/evtgen-R01-07-00.tar.gz
requires:
  - CMake
  - pythia8
  - photoscpp
  - tauolacpp
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DEVTGEN_PHOTOS=ON \
    ${PHOTOSCPP_ROOT:+-DPHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}"} \
    -DEVTGEN_PYTHIA=ON \
    ${PYTHIA8_ROOT:+-DPYTHIA8_ROOT_DIR="${PYTHIA8_ROOT}"} \
    -DEVTGEN_TAUOLA=ON \
    ${TAUOLACPP_ROOT:+-DTAUOLAPP_ROOT_DIR="${TAUOLACPP_ROOT}"}
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} FLIBS=${FORTRAN_LIBRARY}
}
