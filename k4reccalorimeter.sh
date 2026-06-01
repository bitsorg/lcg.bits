package: k4reccalorimeter
description: Key4hep calorimeter reconstruction algorithms
version: "0.1.0pre18"
tag: "v0.1.0pre18"
source: https://github.com/HEP-FCC/k4RecCalorimeter.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - DD4hep
  - k4geo
  - marlinutil
  - fastjet
  - k4simgeant4
  - ROOT
  - onnxruntime
  - simsipm
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
