package: expat
description: Expat XML parsing library
version: "2.9.0"
source: https://github.com/libexpat/libexpat
tag: "R_2_9_0"
# bits upgrade: no tarball of 2.9.0 in the usual place, upstream's instead
sources:
  - https://github.com/libexpat/libexpat/releases/download/R_2_9_0/expat-%(version)s.tar.gz
prefer_system: ".*"
prefer_system_check:

requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - cpe:2.3:a:libexpat_project:libexpat:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
    -DEXPAT_BUILD_DOCS=OFF \
    -DCMAKE_C_FLAGS=-fPIC
}
