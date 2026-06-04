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
  # NOTE: the previous combined sed was malformed -- the NLOX_PROCESSES
  # replacement string was split across two separate shell words by the line
  # continuation, so neither substitution applied (the OneLOop download URL was
  # left with the dead duplicate 'helac-phegas/' path component -> 404). Run the
  # two substitutions as well-formed, separate commands instead.
  #
  # 1) Restrict the built process list to the ones this stack needs.
  perl -i -pe 's/set\(NLOX_PROCESSES [^)]*\)/set(NLOX_PROCESSES pp_Wpttbar pp_Zttbar_as3ae1 pp_ttbarepem_as3ae2 pp_Wmttbar)/' \
    "$SOURCEDIR/CMakeLists.txt"
  # 2) Fix the OneLOop/QCDLoop download URL: the site dropped the duplicate
  #    'helac-phegas/' path component (helac-phegas.web.cern.ch/tar-files/...).
  perl -i -pe 's|helac-phegas/tar-files|tar-files|g' "$SOURCEDIR/CMakeLists.txt"
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DNLOX_PROCESSES_URL=https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/nlox/downloads/processes/v1.2.0/ \
    -DNLOX_ENABLE_QCDLOOP2=OFF \
    -DNLOX_ENABLE_QCDLOOP=ON
}

function Make() {
  # QCDLoop is built as a CMake ExternalProject, and its Makefile has a Fortran
  # module-order race: test.o is compiled before qldiffi2.mod is produced. Under
  # a parallel build the GNU make jobserver propagates into QCDLoop's nested make
  # and triggers it ("Cannot open module file 'qldiffi2.mod'"). Build the bulk
  # (the C++ process code) in parallel for speed, then run a serial pass that
  # finishes QCDLoop without the race. The serial pass is authoritative, so a
  # genuine error still fails the build.
  cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS} || true
  cmake --build . -- ${CMAKE_OPTIONS} -j1
}
