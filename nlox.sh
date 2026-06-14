package: nlox
description: NLox one-loop matrix element provider library
version: "1.2.2.atlas7"
tag: "1.2.2.atlas7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # 1) Restrict the built process list to the ones this stack needs.
  perl -i -pe 's/set\(NLOX_PROCESSES [^)]*\)/set(NLOX_PROCESSES pp_Wpttbar pp_Zttbar_as3ae1 pp_ttbarepem_as3ae2 pp_Wmttbar)/' \
    "$SOURCEDIR/CMakeLists.txt"
  # 2) Fix the OneLOop/QCDLoop download URL: site dropped the duplicate
  #    'helac-phegas/' path component.
  perl -i -pe 's|helac-phegas/tar-files|tar-files|g' "$SOURCEDIR/CMakeLists.txt"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DNLOX_PROCESSES_URL=https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox/downloads/processes/v1.2.0/ \
    -DNLOX_ENABLE_QCDLOOP2=OFF \
    -DNLOX_ENABLE_QCDLOOP=ON
}

function Make() {
  # QCDLoop (CMake ExternalProject) has a Fortran module-order race that fires
  # under parallel make (qldiffi2.mod). Build the bulk in parallel for speed, then
  # a serial pass finishes QCDLoop race-free (authoritative, still fails on error).
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} || true
  cmake --build . -- ${CMAKE_OPTIONS} -j1
}
