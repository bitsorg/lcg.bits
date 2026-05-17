package: gdal
description: GDAL Geospatial Data Abstraction Library Python bindings
version: "3.10.2"
tag: "3.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gdal-3.10.2.tar.gz
requires:
  - curl
  - zlib
  - netcdfc
  - libgeotiff
  - sqlite
  - hdf5
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
  cmake $SOURCEDIR \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$INSTALLROOT \
    -DCMAKE_CXX_STANDARD=17 \
    -DNETCDF_DIR=${netcdfc_ROOT} \
    -DSWIG_EXECUTABLE=${swig_ROOT}/bin/swig \
    -DBUILD_SHARED_LIBS=ON \
    --prefix=$INSTALLROOT \
    --with-netcdf=${netcdfc_ROOT} \
    --with-geotiff=${libgeotiff_ROOT} \
    --with-hdf5=${hdf5_ROOT} \
    --with-libtiff=${tiff_ROOT} \
    --with-sqlite3=${sqlite_ROOT}
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}