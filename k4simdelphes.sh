package: k4simdelphes
description: Key4hep Delphes fast simulation wrapper
version: "00.07.06"
tag: "v00-07-06"
source: https://github.com/key4hep/k4SimDelphes.git
requires:
  - CMake
  - k4fwcore
  - delphes
  - pythia8
  - hepmc3
  - evtgen
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
    -DPYTHIA8_ROOT_DIR="${PYTHIA8_ROOT}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
