package: Geant4
description: Geant4 Monte Carlo particle transport simulation toolkit
version: "11.4.0"
mem_per_job: 1500
tag: "11.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/geant4.11.4.0.tar.gz
requires:
  - CMake
  - XercesC
  - expat
  - Python
  - Boost
  - clhep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Geant4-SL-1.0
prepend_path:
  ROOT_INCLUDE_PATH:
    - "$GEANT4_ROOT/include/Geant4"
    - "$GEANT4_ROOT/include"
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
    -DCMAKE_CXX_FLAGS="-fPIC" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGEANT4_USE_GDML=ON \
    -DXERCESC_ROOT_DIR="${XercesC_ROOT}" \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_G3TOG4=ON \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_ENABLE_TESTING=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DGEANT4_INSTALL_EXAMPLES=OFF \
    -DGEANT4_BUILD_MULTITHREADED=OFF \
    -DGEANT4_BUILD_TLS_MODEL=global-dynamic \
    -DGEANT4_BUILD_CXXSTD="${CXXSTD:-20}"
}
function PostInstall() {
  cat >> "$INSTALLROOT/etc/modulefiles/$PKGNAME" << 'MODEOF'
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include/Geant4
prepend-path ROOT_INCLUDE_PATH $PKG_ROOT/include
MODEOF
}
