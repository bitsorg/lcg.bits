package: ROOT
description: CERN ROOT data analysis framework
version: "v6.32.02"
tag: "v6.32.02"
sources:
  - https://root.cern/download/root_v6.32.02.source.tar.gz
requires:
  - Python
  - fftw
  - GSL
  - xrootd
  - numpy
  - tbb
  - blas
  - zlib
  - libxml2
  - vdt
  - xz
  - gl2ps
  - cfitsio
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
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
    -Dcheck_connection=OFF \
    -DCINTLONGLINE=4096 \
    -DCINTMAXSTRUCT=36000 \
    -DCINTMAXTYPEDEF=36000 \
    -DPYTHON_EXECUTABLE=${Python_ROOT}/bin/python \
    -Dbuiltin_ftgl=ON \
    -Dbuiltin_glew=ON \
    -Dbuiltin_pcre=ON \
    -Dbuiltin_unuran=ON \
    -Dbuiltin_xxhash=ON \
    -Dcintex=ON \
    -Dexplicitlink=ON \
    -Dfail-on-missing=ON \
    -Dfftw3=ON \
    -Dfitsio=ON \
    -Dfortran=ON \
    -Dgdml=ON \
    -Dgenvector=ON \
    -Dhttp=ON \
    -Dmathmore=ON \
    -Dopengl=ON \
    -Dpyroot=ON \
    -Dpythia8=OFF \
    -Dr=OFF \
    -Dreflex=ON \
    -Droofit=ON \
    -Droofit_multiprocess=OFF \
    -Droot7=ON \
    -Dssl=ON \
    -Dtesting=${ROOT_TESTING} \
    -Dunfold=ON \
    -Dunuran=ON \
    -Dxft=ON \
    -Dxml=ON \
    -Dxrootd=ON \
    -Dzlib=ON
}
function Make() {
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
