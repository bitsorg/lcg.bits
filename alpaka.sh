package: alpaka
description: Alpaka abstraction library for parallel kernel acceleration
version: "2.1.1"
tag: "2.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Boost
  - tbb
  # CUDA (conditional: only --defaults cuda builds, arch tagged -cuda):
  - "cuda:.*-cuda$"
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--inc"
##############################
function Configure() {
  # Enable the CUDA accelerator backend only under --defaults cuda. ENABLE_CUDA
  # is set (to ON) by defaults-cuda; an unset value is treated as OFF.
  local cuda_opts=()
  if [ "${ENABLE_CUDA:-OFF}" = "ON" ]; then
    cuda_opts+=(-DALPAKA_ACC_GPU_CUDA_ENABLE=ON)
    [ -n "${CMAKE_CUDA_ARCHITECTURES:-}" ] && cuda_opts+=(-DCMAKE_CUDA_ARCHITECTURES="${CMAKE_CUDA_ARCHITECTURES}")
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    "${cuda_opts[@]}" \
    -DCMAKE_CXX_STANDARD=17
}
