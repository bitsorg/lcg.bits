package: geant4_vmc
description: Geant4 VMC (Virtual Monte Carlo) interface library
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4_vmc-unknown.tar.gz
requires:
  - CMake
  - ROOT
  - Geant4
  - vgm
  - vmc
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
env:
  G4VMCINSTALL: "$GEANT4_VMC_ROOT"
  USE_VGM: "1"
prepend_path:
  ROOT_INCLUDE_PATH:
    - "$GEANT4_VMC_ROOT/include/geant4vmc"
    - "$GEANT4_VMC_ROOT/include/g4root"
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  export LDFLAGS="${LDFLAGS:+$LDFLAGS }-L${GEANT4_ROOT}/lib"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGeant4VMC_BUILD_G4Root=ON \
    -DGeant4VMC_BUILD_G4Root_TEST=OFF \
    -DGeant4VMC_BUILD_Geant4VMC=ON \
    -DGeant4VMC_BUILD_EXAMPLES=OFF \
    -DGeant4VMC_USE_G4Root=ON \
    -DGeant4VMC_USE_VGM=ON \
    -DGeant4VMC_USE_GEANT4_UI=ON \
    -DGeant4VMC_USE_GEANT4_VIS=ON \
    -DGeant4VMC_USE_GEANT4_G3TOG4=OFF \
    -DGeant4VMC_INSTALL_EXAMPLES=OFF
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'EOF'
setenv GEANT4_VMC_ROOT $PKG_ROOT
setenv G4VMCINSTALL $PKG_ROOT
setenv USE_VGM 1
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include/geant4vmc
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include/g4root
EOF
}
