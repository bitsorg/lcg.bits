package: ROOT
description: CERN ROOT data analysis framework
version: "v6.32.02"
tag: "v6.32.02"
sources:
  - https://root.cern/download/root_v6.32.02.source.tar.gz
requires:
  - CMake
  - Python
  - fftw
  - GSL
  - OpenSSL
  - xrootd
  - Davix
  - numpy
  - tbb
  - blas
  - zlib
  - libxml2
  - vdt
  - xz
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
MODULE_OPTIONS="--bin --lib --pylib"
##############################
function Prepare() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}/" ./
  # ROOT's CMakeLists.txt does set(CMAKE_MODULE_PATH ...) which replaces any
  # -DCMAKE_MODULE_PATH passed on the command line, so we must patch the source.
  # FindDavix.cmake uses only pkg_check_modules; prepend a find_library fallback
  # via DAVIX_ROOT so discovery works even when davix.pc is absent or misplaced.
  # Guard prevents double-patching on reruns.
  if ! grep -q 'bits: direct fallback' "${SOURCEDIR}/cmake/modules/FindDavix.cmake"; then
    sed -i 's|^find_package(PkgConfig)$|# bits: direct fallback via DAVIX_ROOT cmake var or env var\nif(NOT DAVIX_FOUND AND (DEFINED DAVIX_ROOT OR DEFINED ENV{DAVIX_ROOT}))\n  if(DEFINED DAVIX_ROOT)\n    set(_davix_root ${DAVIX_ROOT})\n  else()\n    set(_davix_root $ENV{DAVIX_ROOT})\n  endif()\n  find_path(DAVIX_INCLUDE_DIR davix/davix.hpp PATHS ${_davix_root}/include NO_DEFAULT_PATH)\n  find_library(DAVIX_LIBRARY NAMES davix PATHS ${_davix_root}/lib ${_davix_root}/lib64 NO_DEFAULT_PATH)\n  if(DAVIX_INCLUDE_DIR AND DAVIX_LIBRARY)\n    set(DAVIX_FOUND TRUE)\n    set(DAVIX_INCLUDE_DIRS ${DAVIX_INCLUDE_DIR})\n    set(DAVIX_LIBRARIES ${DAVIX_LIBRARY})\n    set(DAVIX_LIBRARY ${DAVIX_LIBRARY})\n    message(STATUS "Found Davix via DAVIX_ROOT: ${DAVIX_LIBRARY}")\n  endif()\nendif()\nfind_package(PkgConfig)|' "${SOURCEDIR}/cmake/modules/FindDavix.cmake"
  fi
}
function Configure() {
  # Detect C++ standard from environment before unsetting flags
  CMAKE_CXX_STANDARD=17
  [[ "$CXXFLAGS" == *'-std=c++14'* ]] && CMAKE_CXX_STANDARD=14
  [[ "$CXXFLAGS" == *'-std=c++17'* ]] && CMAKE_CXX_STANDARD=17
  [[ "$CXXFLAGS" == *'-std=c++20'* ]] && CMAKE_CXX_STANDARD=20
  [[ "$CXXFLAGS" == *'-std=c++23'* ]] && CMAKE_CXX_STANDARD=23

  # ROOT must not see these or it picks up wrong flags
  unset ROOTSYS CXXFLAGS CFLAGS LDFLAGS

  # Expose xrootd location via the env var ROOT's cmake actually checks
  [[ -n "${XROOTD_ROOT}" ]] && export XRDSYS="${XROOTD_ROOT}"

  # FindDavix.cmake uses only pkg_check_modules — no cmake-variable fallback.
  # Locate davix.pc wherever it landed (lib/pkgconfig or lib/*/pkgconfig on
  # Ubuntu multiarch) and prepend that directory to PKG_CONFIG_PATH.
  if [[ -n "${DAVIX_ROOT}" ]]; then
    _davix_pc=$(find "${DAVIX_ROOT}/lib" "${DAVIX_ROOT}/lib64" -name 'davix.pc' -print -quit 2>/dev/null)
    [[ -n "$_davix_pc" ]] && export PKG_CONFIG_PATH="$(dirname "$_davix_pc")${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"
  fi

  # FindVdt.cmake uses plain find_path/find_library with no hint variables and
  # VDT installs no cmake config or pkg-config files.  Pre-set the exact cache
  # variables FindVdt expects so cmake skips the search entirely.
  if [[ -n "${VDT_ROOT}" ]]; then
    _vdt_lib=$(find "${VDT_ROOT}/lib" "${VDT_ROOT}/lib64" \( -name 'libvdt.so' -o -name 'libvdt.dylib' \) -print -quit 2>/dev/null)
  fi


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
  PYTHON_EXECUTABLE="${PYTHON_ROOT}/bin/python3"
  [[ -x "$PYTHON_EXECUTABLE" ]] || PYTHON_EXECUTABLE=$(command -v python3 2>/dev/null || command -v python 2>/dev/null || true)

  # Pre-set cmake FindPython3 cache variables so cmake skips subprocess
  # detection entirely.  PYTHON_ROOT, PYTHON_INCLUDE_DIR, and PYTHONPATH
  # are all set by bits module files.
  _pymajmin=$(${PYTHON_EXECUTABLE} -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null || true)
  _python_inc="${PYTHON_INCLUDE_DIR}/python${_pymajmin}"
  _python_lib=$(find "${PYTHON_ROOT}/lib" "${PYTHON_ROOT}/lib64" \
    \( -name 'libpython3*.so' ! -name '*.so.1*' \) -print -quit 2>/dev/null || true)
  _numpy_inc=$(${PYTHON_EXECUTABLE} -c "import numpy; print(numpy.get_include())" 2>/dev/null \
    || find "${NUMPY_ROOT:-/dev/null}/lib/python${_pymajmin}/site-packages/numpy" \
         -name 'ndarraytypes.h' -exec dirname {} \; 2>/dev/null | head -1 || true)
  unset _pymajmin

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
    ${GSL_ROOT:+-DGSL_ROOT_DIR=$GSL_ROOT} \
    ${DAVIX_ROOT:+-DDAVIX_ROOT=$DAVIX_ROOT} \
    ${VDT_ROOT:+-DVDT_INCLUDE_DIR=$VDT_ROOT/include} \
    ${_vdt_lib:+-DVDT_LIBRARY=$_vdt_lib} \
    ${PYTHON_ROOT:+-DPython3_ROOT_DIR=$PYTHON_ROOT} \
    ${_python_inc:+-DPython3_INCLUDE_DIR=$_python_inc} \
    ${_python_lib:+-DPython3_LIBRARY=$_python_lib} \
    ${_numpy_inc:+-DPython3_NumPy_INCLUDE_DIRS=$_numpy_inc} \
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
function PostInstall() {
  printf 'setenv ROOTSYS $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
