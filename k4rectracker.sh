package: k4rectracker
description: Key4hep tracker reconstruction algorithms
version: "0.7.0"
tag: "v0.7.0"
source: https://github.com/key4hep/k4RecTracker.git
requires:
  - CMake
  - k4fwcore
  - DD4hep
  - ROOT
  - marlinutil
  - pandorasdk
  - delphes
  - onnxruntime
  - torch
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
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=20 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
