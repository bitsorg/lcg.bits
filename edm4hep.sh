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
. $(bits-include BitsPython)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function SetBuildEnv() {
  _SetBuildEnvBase
  # podio's datamodel code generator (invoked during the EDM4hep build via
  # podioMacros) imports jinja2/markupsafe/yaml.  bits' build env exposes each
  # dependency's $*_ROOT but not its Python site-packages, so add every one to
  # PYTHONPATH.  bits_pythonpath_from_deps returns 0, so SetBuildEnv stays
  # success-valued under Run()'s `set -e`.
  bits_pythonpath_from_deps
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
