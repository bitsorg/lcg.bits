package: mcfm
description: MCFM Monte Carlo for FeMtobarn processes (NLO parton-level)
version: "10.3.atlas"
tag: "10.3.atlas"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/MCFM-10.3.tar.gz
requires:
  - CMake
  - lhapdf
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-MCFM
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# macOS: not ported. qcdloop needs GCC quadmath/__float128 (no Apple clang arm64)
# while std:: CXX_Interface wants libc++, so neither toolchain is clean. Gate off
# (empty package); consumers gate "mcfm:(?!osx)". Remove the guards to resume.
##############################
function Configure() {
  bits_is_macos && { mkdir -p "${INSTALLROOT}"; return 0; }
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path="${LHAPDF_ROOT}/include" \
    -Dwith_library=ON
}
function Make() {
  # macOS: gated off (see above).
  bits_is_macos && return 0
  # handyG (a CMake sub-project) has a Fortran-module race: under parallel make,
  # gpl_module.f compiles before maths_functions.mod is written. Build handyG (+qd)
  # serially, then the rest with full -j; if 'handyg' is unavailable, build serially.
  if cmake --build "$BITS_CMAKE_BUILD" --target handyg -- -j1; then
    cmake --build "$BITS_CMAKE_BUILD" -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
  else
    echo "bits: 'handyg' target unavailable; falling back to a full serial build" >&2
    cmake --build "$BITS_CMAKE_BUILD" -- ${CMAKE_OPTIONS} -j1
  fi
}
function MakeInstall() {
  # macOS: gated off (see above).
  bits_is_macos && return 0
  cmake --install "$BITS_CMAKE_BUILD"
}
function PostInstall() {
  # macOS: gated off (see above).
  bits_is_macos && return 0
  # MCFM's cmake install doesn't expose the lib/headers as consumers expect (Sherpa's
  # FindMCFM wants MCFM/CXX_Interface.h and a lib named mcfm/MCFM). Install headers
  # under include/MCFM and the lib under both names; libmcfm.so is in $BITS_CMAKE_BUILD, headers in $BITS_CMAKE_SRC.
  mkdir -p "${INSTALLROOT}/include" "${INSTALLROOT}/lib"
  [ -d "$BITS_CMAKE_SRC/src/Inc/MCFM" ] && cp -rf "$BITS_CMAKE_SRC/src/Inc/MCFM" "${INSTALLROOT}/include/"
  local _lib
  _lib="$(find "$BITS_CMAKE_BUILD" "${INSTALLROOT}/lib" -name 'libmcfm.so' -print -quit 2>/dev/null)"
  if [ -n "${_lib}" ]; then
    cp -f "${_lib}" "${INSTALLROOT}/lib/libmcfm.so"
    cp -f "${_lib}" "${INSTALLROOT}/lib/libMCFM.so"
  fi
}
