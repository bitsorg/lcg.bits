package: DD4hep
description: Detector Description for HEP (generic detector description toolkit)
version: "v01-35"
mem_per_job: 1500
tag: "v01-35"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  - XercesC
  - Boost
  - Python
  - pytest
  - LCIO
  - tbb
  # Geant4 is required for the DDG4 simulation component. Without it DD4hep does
  # not build/install DDG4, so every downstream key4hep package that does
  # find_package(DD4hep COMPONENTS ... DDG4) fails with
  # "Did not find required component: DDG4" (k4geo, k4mljettagger, ...).
  - Geant4
  # EDM4hep / HepMC3 I/O backends, enabled in the LCG key4hep stack.
  - EDM4hep
  - hepmc3
  # optional:
  # - assimp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only
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
    -DBOOST_ROOT="${Boost_ROOT}" \
    -DCMAKE_CXX_STANDARD=17 \
    -DDD4HEP_USE_XERCESC=ON \
    -DXERCESC_ROOT_DIR="${XercesC_ROOT}" \
    -DROOTSYS="${ROOT_ROOT}" \
    -DDD4HEP_USE_GEANT4=ON \
    -DDD4HEP_USE_LCIO=ON \
    -DDD4HEP_USE_TBB=ON \
    -DDD4HEP_USE_HEPMC3=ON \
    -DDD4HEP_USE_EDM4HEP=ON \
    -DDD4HEP_LOAD_ASSIMP=OFF \
    -DDD4HEP_BUILD_EXAMPLES=OFF \
    -DBUILD_DOCS=OFF
}
