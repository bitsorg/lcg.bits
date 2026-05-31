package: acts
description: ACTS track reconstruction framework for HEP experiments
version: "46.5.0"
tag: "46.5.0"
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
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function SetBuildEnv() {
  _SetBuildEnvBase
  # ACTS runs Python codegen scripts at build time (sympy stepper math, particle
  # data table) that import numpy/sympy/particle.  The build env exposes each
  # dependency's $*_ROOT but not its Python site-packages, so the scripts fail
  # with "ModuleNotFoundError: No module named 'numpy'/'particle'".  Add every
  # dependency's site-packages to PYTHONPATH (the codegen venv honours it).
  local _pyver _r _sp
  _pyver=$(python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])' 2>/dev/null)
  for _r in $(env | grep -E '^[A-Za-z][A-Za-z0-9_]*_ROOT=' | cut -d= -f1); do
    _sp="${!_r}/lib/python${_pyver}/site-packages"
    [ -d "${_sp}" ] && export PYTHONPATH="${_sp}${PYTHONPATH:+:${PYTHONPATH}}"
  done
  # The loop's last `[ -d ] && export` is non-zero when the final dependency has
  # no site-packages; Run() calls SetBuildEnv standalone under `set -e`, so a
  # non-zero return would abort the build silently before Configure.  Force 0.
  return 0
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
