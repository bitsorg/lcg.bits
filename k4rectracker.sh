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
  # podio's datamodel generator (PODIO_GENERATE_DATAMODEL for DCHdigi) imports
  # jinja2/markupsafe/yaml at configure time.
  - Jinja2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsPython)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function SetBuildEnv() {
  _SetBuildEnvBase
  # podio's datamodel code generator (invoked via podioMacros while configuring
  # DCHdigi) imports jinja2/markupsafe/yaml. bits exposes each dependency's
  # $*_ROOT but not its Python site-packages, so add them to PYTHONPATH.
  bits_pythonpath_from_deps
}
function Configure() {
  # PyTorch's CMake config lives in its pip site-packages; point find_package(Torch)
  # there directly. The modulefile Torch_DIR doesn't reach the build env, and a
  # <prefix>/share/cmake symlink breaks Caffe2Targets' prefix derivation.
  _pyver=$(python3 -c 'import sys; print("python%d.%d" % sys.version_info[:2])')
  export Torch_DIR="${TORCH_ROOT}/lib/${_pyver}/site-packages/torch/share/cmake/Torch"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
