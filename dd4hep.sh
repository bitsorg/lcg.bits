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
patches:
  # Geant4 units (mm = 1), which LHCb's Detector requires: on where the defaults
  # set the dd4hep_geant4_units variable (defaults-lhcb), as LCG's LHCb layer does.
  - "DD4hep-geant4-units.patch:(?dd4hep_geant4_units)"
license: LGPL-3.0-only
env:
  DD4hepINSTALL: "$DD4HEP_ROOT"
  DD4HEP: "$DD4HEP_ROOT/examples"
  DD4hep_DIR: "$DD4HEP_ROOT"
  DD4hep_ROOT: "$DD4HEP_ROOT"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --root-inc"
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
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" <<'EoF'
setenv DD4hepINSTALL $PKG_ROOT
setenv DD4HEP $PKG_ROOT/examples
setenv DD4hep_DIR $PKG_ROOT
setenv DD4hep_ROOT $PKG_ROOT
EoF
  for _sp in "$INSTALLROOT"/lib*/python*/site-packages; do
    if [ -d "$_sp" ]; then
      echo "prepend-path PYTHONPATH \$PKG_ROOT/${_sp#$INSTALLROOT/}" >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
    fi
  done
}
