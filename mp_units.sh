package: mp_units
description: mp-units compile-time C++ units of measurement library
version: "bfcb26e5"
tag: "bfcb26e5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - cppgsl
  - fmt
  - Catch2
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
    -DCMAKE_PREFIX_PATH="${CPPGSL_ROOT}" \
    -DMP_UNITS_API_CONTRACTS=MS-GSL
}
