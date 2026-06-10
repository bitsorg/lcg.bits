package: k4clue
description: Key4hep CLUE clustering algorithm
version: "01.01.00"
tag: "v01-01-00"
source: https://github.com/key4hep/k4Clue.git
requires:
  - CMake
  - DD4hep
  - k4fwcore
  - alpaka
  - cluestering
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
  # k4Clue enables CUDA whenever nvcc is on PATH (check_language(CUDA)), but the
  # CUDA target fails under CUDA 12.4 on Gaudi's std::format. Build it only under
  # --defaults cuda (ENABLE_CUDA=ON); else seed CMAKE_CUDA_COMPILER=NOTFOUND to skip it.
  local cuda_args=()
  if [ "${ENABLE_CUDA:-OFF}" != "ON" ]; then
    cuda_args+=(-DCMAKE_CUDA_COMPILER=NOTFOUND)
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    "${cuda_args[@]}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
