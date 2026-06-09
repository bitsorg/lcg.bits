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
  # macOS: gated off. RELAX builds Reflex/ROOT dictionaries whose generated code
  # makes the compiler synthesize TClass's copy constructor, which ROOT v6.40
  # deletes (its std::atomic members are non-copyable): "copying member subobject
  # of type 'std::atomic<...>' invokes deleted constructor". That is a hard error
  # under Apple clang / the macOS-26 SDK that no flag can downgrade. RELAX has no
  # dependents, so produce an empty package; remove the guards (here, Make,
  # MakeInstall) to resume the port. Linux unchanged.
  bits_is_macos && { mkdir -p "$INSTALLROOT"; return 0; }
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
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
