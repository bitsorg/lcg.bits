package: EDM4hep
description: Event Data Model for High Energy Physics (Key4hep framework)
version: "1.0"
mem_per_job: 1500
tag: "1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ROOT
  - podio
  - Jinja2
  - jsonmcpp
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
function SetBuildEnv() {
  _SetBuildEnvBase
  # podio's datamodel code generator (invoked during the EDM4hep build via
  # podioMacros) imports jinja2/markupsafe/yaml.  bits' build env exposes each
  # dependency's $*_ROOT but not its Python site-packages, so the generator
  # fails with "ModuleNotFoundError: No module named 'jinja2'".  Add every
  # dependency's site-packages to PYTHONPATH (same scan PythonRecipe uses).
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
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}" \
    -DCMAKE_UNITY_BUILD=ON
}
