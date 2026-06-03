package: marlinmlflavortagging
description: MarlinML ML-based flavor tagging for ILC
version: "0.1.0"
tag: "v0.1.0"
source: https://gitlab.desy.de/ilcsoft/MarlinMLFlavorTagging.git
requires:
  - CMake
  - LCIO
  - ilcutil
  - lcfivertex
  - marlin
  - ROOT
  - torch
  - AIDA
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
  # PyTorch ships its CMake config inside the pip site-packages tree; point
  # find_package(Torch) at the real dir. The modulefile Torch_DIR doesn't reach
  # the build env, and a <prefix>/share/cmake symlink breaks Caffe2Targets'
  # prefix derivation (it would look for the libs under <prefix>/lib).
  _pyver=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])')
  export Torch_DIR="${TORCH_ROOT}/lib/${_pyver}/site-packages/torch/share/cmake/Torch"
  # find_package(AIDA) resolves via RAIDA's config (the AIDA 3.2.1 package ships
  # no AIDAConfig.cmake); RAIDA installs it under lib/cmake/RAIDA. RAIDA_ROOT is
  # exported transitively via marlin. Same fix as marlin.sh.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DAIDA_DIR="${RAIDA_ROOT}/lib/cmake/RAIDA" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
