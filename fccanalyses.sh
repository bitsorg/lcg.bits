package: fccanalyses
description: FCCAnalyses analysis framework for FCC experiments
version: "0.12.0"
tag: "v0.12.0"
source: https://github.com/HEP-FCC/FCCAnalyses.git
requires:
  - CMake
  - EDM4hep
  - k4fwcore
  - fastjet
  - eigen
  - DD4hep
  - delphes
  - "vdt:(?!osx)"
  # WITH_ONNX=AUTO find_package(onnxruntime)s and half-matches unless onnxruntime
  # is on CMAKE_PREFIX_PATH, breaking the link. Make it a real dep so ONNX builds.
  - onnxruntime
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
  # FindDelphes.cmake reaches the bundled TrackCovariance headers only via
  # $DELPHES_DIR; bits exports DELPHES_ROOT (and the modulefile setenv is
  # runtime-only), so map it for the build here.
  export DELPHES_DIR="${DELPHES_ROOT}"
  # CMakeLists hard-rejects C++23, so pin C++20: -DCMAKE_CXX_STANDARD=20 plus a
  # trailing -std=c++20 overriding the stack-default -std=c++23 in CXXFLAGS.
  export CXXFLAGS="${CXXFLAGS} -std=c++20"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=20 \
    -DWITH_DD4HEP=ON
}
