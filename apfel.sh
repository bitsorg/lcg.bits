package: apfel
description: APFEL parton distribution function evolution library
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - lhapdf
  - swig
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --python"
##############################
function Configure() {
  # APFEL >= 3.1.0 switched from autotools to CMake (the old AutoTools recipe
  # ran ./configure, which no longer exists -> "./configure: No such file or
  # directory"). Mirror lcgcmake LCG_109: CMake with the Python (SWIG) wrapper
  # and LHAPDF enabled. SWIG/SWIG_LIB must be visible for the python bindings.
  # Tests and the build-time PDF download are disabled (the latter needs network
  # and is only required to run APFEL's test suite).
  export SWIG="${SWIG_ROOT}/bin/swig"
  export SWIG_LIB="$(${SWIG_ROOT}/bin/swig -swiglib 2>/dev/null)"
  # macOS: CMake's find_package(SWIG) ignores the SWIG/SWIG_LIB env vars and
  # searches PATH, then fails to derive SWIG_DIR ("Could NOT find SWIG (missing:
  # SWIG_DIR)"). Point it at the bits swig executable and its library directory
  # explicitly. Darwin-gated so Linux's (working) PATH-based detection is
  # untouched.
  local _swig=()
  [ "$(uname)" = Darwin ] && _swig=(
    -DSWIG_EXECUTABLE="${SWIG_ROOT}/bin/swig"
    -DSWIG_DIR="$(${SWIG_ROOT}/bin/swig -swiglib)"
  )
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DAPFEL_ENABLE_PYTHON=ON \
    -DAPFEL_ENABLE_LHAPDF=ON \
    -DAPFEL_ENABLE_TESTS=OFF \
    -DAPFEL_DOWNLOAD_PDFS=OFF \
    -DAPFEL_Python_SITEARCH=autoprefix \
    "${_swig[@]}"
}
