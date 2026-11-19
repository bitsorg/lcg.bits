package: utf8proc
description: utf8proc C library for processing and validating UTF-8 text
version: "2.10.0"
source: https://github.com/JuliaStrings/utf8proc
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # utf8proc's CMakeLists uses GNUInstallDirs, which resolves to lib64 on el9/el10
  # and drops libutf8proc.so there; poco (and the stack convention — utf8cpp,
  # pcre2, and ~two dozen other recipes) expect it in lib. Pin libdir to lib.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DBUILD_SHARED_LIBS=ON
}
