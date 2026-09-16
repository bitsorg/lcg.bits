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
  # DDG4 / IO backends. A group overlay can drop these via `disable:` (LHCb does,
  # for its minimal DD4hep); the Configure() flags below follow dependency-root
  # presence, so a disabled backend turns its -DDD4HEP_USE_* OFF automatically.
  - LCIO
  - tbb
  - Geant4
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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBOOST_ROOT="${BOOST_ROOT}" \
    -DCMAKE_CXX_STANDARD=17 \
    -DDD4HEP_USE_XERCESC=ON \
    -DXERCESC_ROOT_DIR="${XERCESC_ROOT}" \
    -DROOTSYS="${ROOT_ROOT}" \
    -DDD4HEP_USE_GEANT4=$([ -n "$GEANT4_ROOT" ] && echo ON || echo OFF) \
    -DDD4HEP_USE_LCIO=$([ -n "$LCIO_ROOT" ] && echo ON || echo OFF) \
    -DDD4HEP_USE_TBB=ON \
    -DDD4HEP_USE_HEPMC3=$([ -n "$HEPMC3_ROOT" ] && echo ON || echo OFF) \
    -DDD4HEP_LOAD_ASSIMP=OFF \
    -DDD4HEP_BUILD_EXAMPLES=OFF \
    -DBUILD_DOCS=OFF
}
# NOTE: DD4HEP_USE_EDM4HEP is intentionally OFF: v01-35's EDM4hep I/O targets an
# older podio API and fails to compile against this stack's podio. DDG4 (needed
# downstream) doesn't use that reader; re-enabling needs aligned DD4hep/podio.
