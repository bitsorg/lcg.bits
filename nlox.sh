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
  # perl -i (not sed -i) so the in-place edits are portable under BSD sed.
  # 1) Restrict the built process list to the ones this stack needs.
  perl -i -pe 's/set\(NLOX_PROCESSES [^)]*\)/set(NLOX_PROCESSES pp_Wpttbar pp_Zttbar_as3ae1 pp_ttbarepem_as3ae2 pp_Wmttbar)/' \
    "$BITS_CMAKE_SRC/CMakeLists.txt"
  # 2) Fix the OneLOop/QCDLoop download URL: site dropped the duplicate 'helac-phegas/'.
  perl -i -pe 's|helac-phegas/tar-files|tar-files|g' "$BITS_CMAKE_SRC/CMakeLists.txt"
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DNLOX_PROCESSES_URL=https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox/downloads/processes/v1.2.0/ \
    -DNLOX_ENABLE_QCDLOOP2=OFF \
    -DNLOX_ENABLE_QCDLOOP=ON
}

function Make() {
  # QCDLoop (CMake ExternalProject) has a Fortran module-order race under parallel
  # make (qldiffi2.mod). Build the bulk in parallel, then a serial pass finishes
  # QCDLoop race-free (authoritative, still fails on a real error).
  cmake --build "$BITS_CMAKE_BUILD" -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} || true
  cmake --build "$BITS_CMAKE_BUILD" -- ${CMAKE_OPTIONS} -j1
}
