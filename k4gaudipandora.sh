package: k4gaudipandora
description: Key4hep Gaudi-Pandora PFA integration
version: "0.2.0"
tag: "v0.2.0"
source: https://github.com/key4hep/k4gaudipandora.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - DD4hep
  - ROOT
  - lccontent
  - pandorasdk
  - k4reco
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
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
