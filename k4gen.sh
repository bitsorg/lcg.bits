package: k4gen
description: Key4hep generator wrapper algorithms
version: "0.1pre15"
tag: "v0.1pre15"
source: https://github.com/key4hep/k4gen.git
requires:
  - CMake
  - podio
  - EDM4hep
  - k4fwcore
  - fastjet
  - HepPDT
  - hepmc3
  - evtgen
  - pythia8
  - ROOT
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
    -DCMAKE_CXX_STANDARD=20 \
    -DBUILD_TESTING=OFF \
    -DPython_ROOT_DIR="${Python_ROOT}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
