package: RELAX
description: RELAX XML schema language validation library
version: "6.1.2"
tag: "6.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - cmaketools
  - ROOT
  - clhep
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: gated off. RELAX's Reflex/ROOT dictionaries synthesize TClass's copy ctor,
  # which ROOT v6.40 deletes (non-copyable std::atomic) — a hard Apple-clang error.
  # No dependents; empty package. Remove guards (here, Make, MakeInstall) to resume.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH="${CMAKETOOLS_MODULES}" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS"
}
function Make() {
  bits_is_macos && return 0
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
}
function MakeInstall() {
  bits_is_macos && return 0
  cmake --install .
}
