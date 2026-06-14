package: ddml
description: DDML Machine Learning integration for DD4hep
version: "0.2.0"
tag: "v0.2.0"
source: https://github.com/key4hep/DDML.git
requires:
  - CMake
  - DD4hep
  - torch
  - onnxruntime
  - hdf5
  - openmpi
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
  # find_package(MPI) locates wrappers via mpicxx on PATH, which bits doesn't add.
  # Put OpenMPI's bin on PATH and set OPAL_PREFIX (its runtime root), per lcgcmake.
  export PATH="${OPENMPI_ROOT}/bin:${PATH}"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
  # PyTorch ships its CMake config inside the pip site-packages tree; point
  # find_package(Torch) at the real dir (the modulefile Torch_DIR doesn't reach
  # the build env, and a <prefix>/share/cmake symlink breaks Caffe2's prefix).
  _pyver=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])')
  export Torch_DIR="${TORCH_ROOT}/lib/${_pyver}/site-packages/torch/share/cmake/Torch"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
