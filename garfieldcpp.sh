package: GarfieldCPP
description: Garfield++ toolkit for detailed simulation of gaseous particle detectors
version: "78fe1bd3"
tag: "78fe1bd3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/garfieldpp-%(version)s.tar.gz
requires:
  - ROOT
  - Geant4
  - GSL
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DGARFIELD_WITH_EXAMPLES=OFF \
      -DGARFIELD_WITH_CUDA=OFF \
      ${ROOT_ROOT:+-DROOT_DIR="${ROOT_ROOT}/cmake"} \
      ${GEANT4_ROOT:+-DGeant4_DIR="${GEANT4_ROOT}/lib/Geant4-${GEANT4_VERSION}"} \
      ${GSL_ROOT:+-DGSL_ROOT_DIR="${GSL_ROOT}"}
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv GARFIELD_ROOT $PKG_ROOT
EOF
}
