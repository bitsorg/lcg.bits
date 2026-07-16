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
  # k4Clue's CMakeLists enables CUDA whenever nvcc is on PATH, then compiles the
  # Gaudi algorithm with nvcc - which under CUDA 12.4 fails on Gaudi's std::format.
  # Build CUDA only under --defaults cuda (ENABLE_CUDA=ON); else pre-seed CMAKE_CUDA_COMPILER=NOTFOUND to skip check_language().
  local cuda_args=()
  if [ "${ENABLE_CUDA:-OFF}" != "ON" ]; then
    cuda_args+=(-DCMAKE_CUDA_COMPILER=NOTFOUND)
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    "${cuda_args[@]}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
