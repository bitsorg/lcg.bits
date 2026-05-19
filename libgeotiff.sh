package: libgeotiff
description: libgeotiff GeoTIFF geographic metadata library
version: "1.7.4"
tag: "1.7.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libgeotiff-1.7.4.tar.gz
requires:
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
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_TIFF=ON \
    -DTIFF_DIR=${tiff_ROOT} \
    -DPROJ_DIR=${proj_ROOT} \
    --prefix=$INSTALLROOT \
    --with-proj=${proj_ROOT} \
    --with-libtiff=${tiff_ROOT}
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}