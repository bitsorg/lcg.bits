package: k4reco
description: Key4hep reconstruction framework
version: "0.3.0"
tag: "v0.3.0"
source: https://github.com/key4hep/k4Reco.git
requires:
  - CMake
  - k4fwcore
  - DD4hep
  - k4simgeant4
  - k4geo
  - LCIO
  - ilcutil
  - kaltest
  - ddkaltest
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
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
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
