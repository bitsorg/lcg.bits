package: k4simgeant4
description: Key4hep Geant4 full simulation framework
version: "0.1.0pre17"
tag: "v0.1.0pre17"
source: https://github.com/key4hep/k4SimGeant4.git
requires:
  - CMake
  - k4fwcore
  - DD4hep
  - Geant4
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
    -DBUILD_DOCS=OFF \
    -DPython_ROOT_DIR="${Python_ROOT}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
