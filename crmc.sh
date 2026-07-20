package: crmc
description: CRMC cosmic ray Monte Carlo interface package
version: "2.0.1p5"
tag: "2.0.1p5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/crmc.v2.0.1.tar.gz
requires:
  - CMake
  - Boost
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-CRMC
# possibly open source — treat as external until the license is verified (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
patches:
  - crmc-2.0.1p5.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: the EPOS Fortran objects in CRMC's shared libraries reference sibling
  # model routines resolved only when CRMC loads them together; the two-level
  # namespace rejects undefined symbols at link, so allow them (dynamic_lookup).
  local _lf; _lf=$(bits_macos_undefined_ldflags)
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBOOST_ROOT="${Boost_ROOT}" \
    -DBOOST_INCLUDE_DIR="${Boost_home_include}" \
    -DBoost_NO_SYSTEM_PATHS=TRUE \
    ${_lf:+-DCMAKE_SHARED_LINKER_FLAGS="$_lf"}
}
