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
  - OpenSSL
  - xrootd
  - numpy
  - tbb
  - blas
  - zlib
  - libxml2
  - vdt
  - xz
  - cfitsio
  - CMake
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
  # Detect C++ standard from environment before unsetting flags
  CMAKE_CXX_STANDARD=17
  [[ "$CXXFLAGS" == *'-std=c++14'* ]] && CMAKE_CXX_STANDARD=14
  [[ "$CXXFLAGS" == *'-std=c++17'* ]] && CMAKE_CXX_STANDARD=17
  [[ "$CXXFLAGS" == *'-std=c++20'* ]] && CMAKE_CXX_STANDARD=20
  [[ "$CXXFLAGS" == *'-std=c++23'* ]] && CMAKE_CXX_STANDARD=23

  # ROOT must not see these or it picks up wrong flags
  unset ROOTSYS CXXFLAGS CFLAGS LDFLAGS

  # Platform-specific settings
  SONAME=so
  COMPILER_CXX=g++
  COMPILER_CC=gcc
  ENABLE_COCOA=""
  case $(uname) in
    Darwin)
      ENABLE_COCOA="-Dcocoa=ON"
      COMPILER_CXX=clang++
      COMPILER_CC=clang
      SONAME=dylib
      [[ ! $OPENSSL_ROOT ]] && OPENSSL_ROOT=$(brew --prefix openssl@3 2>/dev/null) || true
      ;;
  esac

  # Python executable: prefer the one from the Python package dep
  PYTHON_EXECUTABLE="${Python_ROOT}/bin/python3"
  [[ -x "$PYTHON_EXECUTABLE" ]] || PYTHON_EXECUTABLE=$(command -v python3 2>/dev/null || command -v python 2>/dev/null || true)

  cmake "${SOURCEDIR}" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD} \
    -DCMAKE_CXX_COMPILER=${COMPILER_CXX} \
    -DCMAKE_C_COMPILER=${COMPILER_CC} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ${ENABLE_COCOA} \
    ${OPENSSL_ROOT:+-DOPENSSL_ROOT=$OPENSSL_ROOT} \
    ${OPENSSL_ROOT:+-DOPENSSL_INCLUDE_DIR=$OPENSSL_ROOT/include} \
    ${PYTHON_EXECUTABLE:+-DPYTHON_EXECUTABLE=$PYTHON_EXECUTABLE} \
    -Dcheck_connection=OFF \
    -DCINTLONGLINE=4096 \
    -DCINTMAXSTRUCT=36000 \
    -DCINTMAXTYPEDEF=36000 \
    -Dbuiltin_ftgl=ON \
    -Dbuiltin_gl2ps=ON \
    -Dbuiltin_glew=ON \
    -Dbuiltin_lz4=ON \
    -Dbuiltin_nlohmannjson=ON \
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
    -Dpgsql=OFF \
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
