package: acts
description: ACTS track reconstruction framework for HEP experiments
version: "26.0.0"
mem_per_job: 2500
mem_utilisation: 0.85
tag: "26.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Boost
  - eigen
  - ROOT
  - DD4hep
  - sympy
  - particle
  - hatchling
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
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
  # ACTS runs Python codegen (sympy/particle) at build time, but the build env
  # exposes deps' $*_ROOT not their site-packages; add each to PYTHONPATH.
  # bits_pythonpath_from_deps returns 0 so SetBuildEnv stays success under set -e.
  bits_pythonpath_from_deps
}
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD="${CXXSTD:-20}" \
    -DACTS_BUILD_PLUGIN_IDENTIFICATION=ON \
    -DACTS_BUILD_PLUGIN_DIGITIZATION=ON \
    -DACTS_BUILD_PLUGIN_DD4HEP=ON \
    -DACTS_BUILD_PLUGIN_JSON=ON \
    -DACTS_BUILD_PLUGIN_TGEO=ON \
    -DACTS_BUILD_UNITTESTS=OFF \
    -DACTS_USE_SYSTEM_LIBS=ON \
    -DCMAKE_CXX_FLAGS="-I${XercesC_ROOT}/include -I${EIGEN_ROOT}/include/eigen3"
}
