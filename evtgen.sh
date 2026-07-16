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
# EvtGen >= 2.0 ships a CMake build that installs EvtGenConfig.cmake, which the
# key4hep packages need (k4gen, k4simdelphes call find_package(EvtGen)). The old
# 1.7.0 autotools build installed no CMake config, so those find_package calls
# failed ("Could not find a package configuration file provided by EvtGen").
# Flags mirror lcgcmake's evtgen >= 2.0 branch; EvtGen 2.x uses HepMC3.
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
