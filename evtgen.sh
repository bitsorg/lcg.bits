package: evtgen
description: EvtGen Monte Carlo generator for B/D meson decays
version: "2.2.1"
source: https://gitlab.cern.ch/evtgen/evtgen
tag: "v%(version)s"
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
# EvtGen >= 2.0 ships a CMake build installing EvtGenConfig.cmake, needed by
# key4hep packages that find_package(EvtGen) (the old 1.7.0 autotools build
# installed none). Flags mirror lcgcmake's evtgen >= 2.0 branch; 2.x uses HepMC3.
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DEVTGEN_PHOTOS=ON  -DPHOTOSPP_ROOT_DIR="${PHOTOSCPP_ROOT}" \
    -DEVTGEN_PYTHIA=ON  -DPYTHIA8_ROOT_DIR="${PYTHIA8_ROOT}" \
    -DEVTGEN_TAUOLA=ON  -DTAUOLAPP_ROOT_DIR="${TAUOLACPP_ROOT}" \
    -DEVTGEN_HEPMC3=ON  -DHEPMC3_ROOT_DIR="${HEPMC3_ROOT}"
}
