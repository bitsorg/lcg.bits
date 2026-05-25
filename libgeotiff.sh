package: libgeotiff
description: libgeotiff GeoTIFF geographic metadata library
version: "1.7.4"
tag: "1.7.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - proj
  - tiff
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
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
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_TIFF=ON \
    -DTIFF_DIR="${TIFF_ROOT}" \
    -DPROJ_DIR="${PROJ_ROOT}" \
    ${PROJ_ROOT:+-DPROJ_INCLUDE_DIR="${PROJ_ROOT}/include"} \
    ${PROJ_ROOT:+-DCMAKE_C_FLAGS="-I${PROJ_ROOT}/include"}
}