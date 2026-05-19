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
  - jsonmcpp
  - gl2ps
  - Vc
  - protobuf
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
  # Default ROOT_TESTING to OFF unless set externally
  ROOT_TESTING=${ROOT_TESTING:-OFF}

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

  # Point cmake at the bits Python installation.  Python3_ROOT_DIR restricts
  # the search to $PYTHON_ROOT; Python3_EXECUTABLE pins the exact interpreter.
  # We do NOT pre-set Python3_INCLUDE_DIR / Python3_LIBRARY /
  # Python3_NumPy_INCLUDE_DIRS — pre-setting those as cmake cache variables
  # overrides cmake's own subprocess detection, and an empty or stale value
  # causes component failures that are harder to diagnose than letting cmake
  # query the interpreter directly (it uses sysconfig and numpy.get_include(),
  # which handle python3.14t ABI tags and numpy 2.x layout correctly).
  # PYTHONPATH is already set by bits module files so "import numpy" works.

  # -------------------------------------------------------------------------
  # Version-gated cmake flags (strip leading 'v' from PKGVERSION for sorting)
  _root_ver="${PKGVERSION#v}"
  # _ver_ge A B: true if version A >= version B
  _ver_ge() { [[ "$(printf '%s\n' "$1" "$2" | sort -V | head -1)" == "$2" ]]; }

  # >= 6.36.00: external jpeg/png packages available; use them
  _media_flags=""
  _ver_ge "$_root_ver" "6.36.00" && _media_flags="-Dbuiltin_jpeg=OFF -Dbuiltin_png=OFF"

  # < 6.40: use builtin copies; >= 6.40: switch to external packages + curl
  if _ver_ge "$_root_ver" "6.40.00"; then
    _builtin_flags="-Dbuiltin_ftgl=OFF -Dbuiltin_gif=OFF -Dbuiltin_glew=OFF -Dbuiltin_lz4=OFF -Dbuiltin_pcre=OFF -Dbuiltin_unuran=OFF -Dbuiltin_xxhash=OFF -Dbuiltin_zstd=OFF -Dcurl=ON"
  else
    _builtin_flags="-Dbuiltin_ftgl=ON -Dbuiltin_gif=ON -Dbuiltin_glew=ON -Dbuiltin_lz4=ON -Dbuiltin_pcre=ON -Dbuiltin_unuran=ON -Dbuiltin_xxhash=ON -Dbuiltin_zstd=ON"
  fi

  # < 6.36.99: explicit pgsql=OFF; >= 6.36.99: roottest flag replaces it
  if _ver_ge "$_root_ver" "6.36.99"; then
    _test_flags="-Droottest=${ROOT_TESTING}"
  else
    _test_flags="-Dpgsql=OFF"
  fi

  # Vc SIMD acceleration: Linux only, ROOT < 6.40, when Vc dep is loaded
  _vc_flag=""
  if [[ $(uname) != Darwin ]] && ! _ver_ge "$_root_ver" "6.40.00" && [[ -n "${VC_ROOT}" ]]; then
    _vc_flag="-Dvc=ON"
  fi

  # SOFIE ONNX model importer: enabled when protobuf is available
  _sofie_flag=""
  [[ -n "${PROTOBUF_ROOT}" ]] && _sofie_flag="-Dtmva-sofie=ON"

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
    -Ddavix=ON \
    ${DAVIX_ROOT:+-DDAVIX_ROOT=$DAVIX_ROOT} \
    ${JSONMCPP_ROOT:+-Dnlohmann_json_ROOT=$JSONMCPP_ROOT} \
    ${GL2PS_ROOT:+-Dgl2ps_ROOT=$GL2PS_ROOT} \
    ${VC_ROOT:+-DVc_ROOT=$VC_ROOT} \
    ${VDT_ROOT:+-DVDT_INCLUDE_DIR=$VDT_ROOT/include} \
    ${_vdt_lib:+-DVDT_LIBRARY=$_vdt_lib} \
    ${PYTHON_ROOT:+-DPython3_ROOT_DIR=$PYTHON_ROOT} \
    ${PYTHON_EXECUTABLE:+-DPython3_EXECUTABLE=$PYTHON_EXECUTABLE} \
    -Dcheck_connection=OFF \
    -DCINTLONGLINE=4096 \
    -DCINTMAXSTRUCT=36000 \
    -DCINTMAXTYPEDEF=36000 \
    ${_builtin_flags} \
    ${_media_flags} \
    -Dbuiltin_nlohmannjson=OFF \
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
    -Dmysql=OFF \
    -Dopengl=ON \
    -Dpyroot=ON \
    -Dpythia8=OFF \
    -Dr=OFF \
    -Dreflex=ON \
    -Droofit=ON \
    -Droofit_multiprocess=OFF \
    -Droot7=ON \
    -Dssl=ON \
    ${_sofie_flag} \
    -Dtesting=${ROOT_TESTING} \
    -Dunfold=ON \
    -Dunuran=ON \
    ${_vc_flag} \
    -Dxft=ON \
    -Dxml=ON \
    -Dxrootd=ON \
    -Dzlib=ON \
    ${_test_flags}
}
function PostInstall() {
  printf 'setenv ROOTSYS $PKG_ROOT\n' >> "$INSTALLROOT/etc/modulefiles/$PKGNAME"
}
