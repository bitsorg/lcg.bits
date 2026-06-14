package: marlinfastjet
description: MarlinFastJet FastJet jet finding Marlin processor
version: "00.05.03"
tag: "v00-05-03"
source: https://github.com/iLCSoft/MarlinFastjet.git
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
  - fastjet
  - fjcontrib
  - ROOT
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
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_CXX_FLAGS="-I${FJCONTRIB_ROOT}/include" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
