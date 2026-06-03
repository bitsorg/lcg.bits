package: Gaudi
description: Gaudi software framework for HEP data processing applications
# v40r4 (lcgcmake master's Gaudi) rather than the LCG_109 v40r2: the key4hep
# packages this stack tracks (k4simgeant4 main, k4reccalorimeter pre18, ...) are
# HEAD-dev and are built against v40r4 upstream. v40r2 fails to compile them
# under gcc15 (IInterface cast<> template / Property.h operator=).
version: "v40r4"
mem_per_job: 1500
tag: "v40r4"
sources:
  - https://gitlab.cern.ch/gaudi/Gaudi/-/archive/%(tag)s/Gaudi-%(tag)s.tar.gz
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
  # gaudi-GaudiToolbox.cmake.patch dropped for v40r4: its sh->bash change is now
  # upstream (env.sh / run are generated with #!/usr/bin/env bash) and its
  # confdb2 output_files hunk is a no-op on Linux (the non-Apple branch already
  # yields a single <Project>.confdb2). The patch only applied against v40r2.
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
      ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
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
