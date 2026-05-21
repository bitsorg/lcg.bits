package: Gaudi
description: Gaudi software framework for HEP data processing applications
version: "%(tag_basename)s"
tag: "v40r2"
source: https://gitlab.cern.ch/gaudi/Gaudi.git
license: Apache-2.0
requires:
  - CMake
  - Boost
  - Python
  - ROOT
  - clhep
  - XercesC
  - rangev3
  - cppgsl
  - xenv
  - six
  - fmt
  - pytest
  - pytest_cov
  - PyYAML
  - jsonmcpp
  - Catch2
  - networkx
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
patches:
  - gaudi-GaudiToolbox.cmake.patch
  - gaudi-merge_confdb2_parts.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake --python"
##############################
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_STANDARD=20 \
      -DCMAKE_FIND_FRAMEWORK=LAST \
      -DGAUDI_USE_DOXYGEN=OFF \
      ${CPPGSL_ROOT:+-DCPPGSL_INCLUDE_DIR="${CPPGSL_ROOT}/include"} \
      ${RANGEV3_ROOT:+-DRANGEV3_INCLUDE_DIR="${RANGEV3_ROOT}/include"} \
      ${ROOT_ROOT:+-DROOT_INCLUDE_DIR="${ROOT_ROOT}/include"} \
      -DGAUDI_USE_HEPPDT=OFF \
      -DGAUDI_USE_AIDA=OFF \
      -DGAUDI_USE_GPERFTOOLS=FALSE \
      -DBoost_NO_BOOST_CMAKE=FALSE
}
