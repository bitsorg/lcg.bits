package: superchic
description: SuperChic Monte Carlo generator for central exclusive processes
version: "5.6.1"
tag: "5.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/superchic-v5.6.1.tar.gz
requires:
  - CMake
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-SuperChic
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # SuperChic 5 switched from a plain Fortran makefile to CMake. Flags mirror
  # lcgcmake's superchic build (LHAPDF_DIR, tests off, long Fortran lines).
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DLHAPDF_DIR="${LHAPDF_ROOT}" \
    -DSUPERCHIC_ENABLE_TESTS=OFF \
    -DCMAKE_Fortran_FLAGS="-ffree-line-length-none"
}
