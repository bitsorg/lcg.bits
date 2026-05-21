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
function Make() {
  # Gaudi's cmake prefetches pytest test-collection during make by invoking
  # pytest, which does 'import ROOT'.  ROOT needs two env vars that bits does
  # NOT propagate from ROOT's modulefile into the build-time init.sh:
  #   ROOTSYS        - used by ROOT's own cmake and some runtime lookups
  #   ROOT_DYN_PATH  - used by system.rootrc to find libCling / libRIO at
  #                    runtime; without it cling never initialises and every
  #                    '#include' / '#pragma' in forward declarations fails.
  export ROOTSYS="${ROOT_ROOT}"
  export ROOT_DYN_PATH="${ROOT_ROOT}/lib${ROOT_DYN_PATH:+:${ROOT_DYN_PATH}}"
  export PYTHONPATH="${ROOT_ROOT}/lib${PYTHONPATH:+:${PYTHONPATH}}"
  make ${JOBS:+-j$JOBS}
}
