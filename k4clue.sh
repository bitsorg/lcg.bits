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
  # k4Clue's CMakeLists unconditionally adds src/k4clueCUDA and enables the CUDA
  # language whenever it detects nvcc on PATH (check_language(CUDA)). nvcc is on
  # PATH in this stack, so the CUDA wrapper target compiles the Gaudi algorithm
  # with nvcc, which under CUDA 12.4 fails on Gaudi's std::format usage
  # ("namespace std has no member format"). The CPU/alpaka target builds fine.
  # Build the CUDA backend only under --defaults cuda (ENABLE_CUDA=ON); otherwise
  # pre-seed CMAKE_CUDA_COMPILER=NOTFOUND so check_language() is skipped and the
  # CUDA subdirectory builds nothing.
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
