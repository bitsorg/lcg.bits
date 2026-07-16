package: acts
description: ACTS track reconstruction framework for HEP experiments
version: "26.0.0"
source: https://github.com/acts-project/acts
mem_per_job: 2500
mem_utilisation: 0.85
tag: "v%(version)s"
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
  # ACTS runs Python codegen scripts at build time (sympy stepper math, particle
  # data table) that import numpy/sympy/particle.  The build env exposes each
  # dependency's $*_ROOT but not its Python site-packages, so add every one to
  # PYTHONPATH (the codegen venv honours it).  bits_pythonpath_from_deps returns
  # 0, so SetBuildEnv stays success-valued under Run()'s `set -e`.
  bits_pythonpath_from_deps
}
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
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
