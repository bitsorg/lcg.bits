package: netcdfc
description: NetCDF-C library for array-oriented scientific data
version: "4.9.3"
tag: "4.9.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/netcdf-c-4.9.3.tar.gz
requires:
  - curl
  - zlib
  - hdf5
  - m4
  - libxml2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT \
    --with-hdf5="${HDF5_ROOT}" \
    --with-curl="${CURL_ROOT}" \
    --with-libxml2="${LIBXML2_ROOT}" \
    CPPFLAGS="-I${HDF5_ROOT}/include ${CURL_ROOT:+-I${CURL_ROOT}/include} ${LIBXML2_ROOT:+-I${LIBXML2_ROOT}/include} ${ZLIB_ROOT:+-I${ZLIB_ROOT}/include}" \
    LDFLAGS="-L${HDF5_ROOT}/lib ${CURL_ROOT:+-L${CURL_ROOT}/lib} ${LIBXML2_ROOT:+-L${LIBXML2_ROOT}/lib} ${ZLIB_ROOT:+-L${ZLIB_ROOT}/lib}"
}
