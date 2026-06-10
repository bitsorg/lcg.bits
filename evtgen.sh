package: evtgen
description: EvtGen Monte Carlo generator for B/D meson decays
version: "2.2.1"
tag: "R02-02-01"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/evtgen-%(tag)s.tar.gz
requires:
  - CMake
  - pythia8
  - photoscpp
  - tauolacpp
  - hepmc3
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# EvtGen >= 2.0 ships a CMake build that installs EvtGenConfig.cmake, needed by
# key4hep's find_package(EvtGen) (k4gen, k4simdelphes). EvtGen 2.x uses HepMC3;
# flags mirror lcgcmake's evtgen >= 2.0 branch.
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DEVTGEN_PHOTOS=ON  -DPHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}" \
    -DEVTGEN_PYTHIA=ON  -DPYTHIA8_ROOT_DIR="${PYTHIA8_ROOT}" \
    -DEVTGEN_TAUOLA=ON  -DTAUOLAPP_ROOT_DIR="${TAUOLACPP_ROOT}" \
    -DEVTGEN_HEPMC3=ON  -DHEPMC3_ROOT_DIR="${HEPMC3_ROOT}"
}
