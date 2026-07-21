package: nlox
description: NLox one-loop matrix element provider library
# atlas7's bundled QCDLoop external stopped configuring (its extracted source
# no longer matches the sed-on-makefile step); atlas9 is the current drop in
# the same MCGeneratorsTarFiles directory.
version: "1.2.2.atlas9"
tag: "1.2.2.atlas9"
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
  # 3) qcdloop.fnal.gov/QCDLoop-1.98.tar.gz was repacked on macOS (June 2026):
  #    it now has an AppleDouble entry (._QCDLoop-1.98) NEXT TO QCDLoop-1.98/.
  #    With two top-level entries CMake's ExternalProject no longer strips the
  #    top directory, so its CONFIGURE_COMMAND (sed on 'makefile') fails with
  #    "can't read makefile". Download once, drop the junk, repack with the
  #    single top-level dir, and point the ExternalProject at the sanitised
  #    local copy (robust whether or not upstream fixes the packing).
  _qcd_tar="${PWD}/QCDLoop-1.98-clean.tar.gz"
  if curl -fSL --retry 3 https://qcdloop.fnal.gov/QCDLoop-1.98.tar.gz -o "${PWD}/QCDLoop-1.98-orig.tar.gz"; then
    rm -rf "${PWD}/qcdloop-clean" && mkdir -p "${PWD}/qcdloop-clean"
    tar -xzf "${PWD}/QCDLoop-1.98-orig.tar.gz" -C "${PWD}/qcdloop-clean" \
        --exclude='._*' --exclude='.DS_Store'
    tar -czf "${_qcd_tar}" -C "${PWD}/qcdloop-clean" QCDLoop-1.98
    grep -rl 'qcdloop\.fnal\.gov/QCDLoop-1\.98\.tar\.gz' "$BITS_CMAKE_SRC" --include=CMakeLists.txt \
      | xargs -r perl -i -pe "s|https://qcdloop\\.fnal\\.gov/QCDLoop-1\\.98\\.tar\\.gz|file://${_qcd_tar}|g"
  else
    echo "WARNING: QCDLoop-1.98 pre-download failed — leaving the upstream URL in place" >&2
  fi
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
