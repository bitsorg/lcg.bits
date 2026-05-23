package: gdal
description: GDAL Geospatial Data Abstraction Library Python bindings
version: "3.10.2"
tag: "3.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DNETCDF_DIR="${NETCDFC_ROOT}" \
    -DSWIG_EXECUTABLE="${SWIG_ROOT}/bin/swig" \
    -DBUILD_SHARED_LIBS=ON \
    -DGDAL_USE_GEOTIFF_INTERNAL=OFF \
    -DGEOTIFF_DIR="${LIBGEOTIFF_ROOT}" \
    -DHDF5_ROOT="${HDF5_ROOT}" \
    -DTIFF_DIR="${TIFF_ROOT}" \
    -DSQLite3_ROOT="${SQLITE_ROOT}"
}