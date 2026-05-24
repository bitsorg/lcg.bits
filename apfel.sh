package: apfel
description: APFEL parton distribution function evolution library
version: "3.0.4"
tag: "3.0.4"
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
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DAPFEL_ENABLE_PYTHON=ON \
    -DAPFEL_ENABLE_TESTS=ON \
    -DAPFEL_ENABLE_LHAPDF=ON \
    -DAPFEL_DOWNLOAD_PDFS=ON \
    -DAPFEL_Python_SITEARCH=autoprefix
}
