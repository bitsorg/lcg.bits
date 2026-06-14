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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --python"
##############################
function Configure() {
  # APFEL >= 3.1.0 builds with CMake (mirror lcgcmake LCG_109): Python (SWIG)
  # wrapper + LHAPDF on, tests and the network PDF download off.
  export SWIG="${SWIG_ROOT}/bin/swig"
  export SWIG_LIB="$(bits_swig_lib)"
  # macOS: find_package(SWIG) ignores the env vars and swig's compiled-in dir is
  # the gone build INSTALLROOT, so pass the relocated SWIG_DIR explicitly.
  local _swig=()
  bits_is_macos && _swig=(-DSWIG_EXECUTABLE="${SWIG}" -DSWIG_DIR="${SWIG_LIB}")
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DAPFEL_ENABLE_PYTHON=ON \
    -DAPFEL_ENABLE_LHAPDF=ON \
    -DAPFEL_ENABLE_TESTS=OFF \
    -DAPFEL_DOWNLOAD_PDFS=OFF \
    -DAPFEL_Python_SITEARCH=autoprefix \
    "${_swig[@]}"
}
