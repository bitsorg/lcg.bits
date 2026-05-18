package: ftgl
description: FTGL OpenGL font rendering library using FreeType
version: "2.4.0"
tag: "2.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ftgl-2.4.0.tar.gz
requires:
  - freetype
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - ftgl-2.4.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_FLAGS=-fpermissive
}
