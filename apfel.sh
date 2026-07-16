package: apfel
description: APFEL parton distribution function evolution library
version: "3.1.0"
source: https://github.com/scarrazza/apfel
tag: "%(version)s"
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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --python"
##############################
function Configure() {
  # APFEL >= 3.1.0 switched from autotools to CMake (no more ./configure).
  # SWIG/SWIG_LIB must be visible for the python bindings; tests and the PDF
  # download are off (the latter needs network, only used by the test suite).
  export SWIG="${SWIG_ROOT}/bin/swig"
  export SWIG_LIB="$(${SWIG_ROOT}/bin/swig -swiglib 2>/dev/null)"
  # macOS: find_package(SWIG) ignores the env vars and swig's compiled-in dir is
  # the gone build INSTALLROOT, so pass the relocated SWIG_DIR explicitly.
  local _swig=()
  bits_is_macos && _swig=(-DSWIG_EXECUTABLE="${SWIG}" -DSWIG_DIR="${SWIG_LIB}")
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
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
