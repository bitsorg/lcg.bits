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
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# macOS: MCFM is not yet ported to macOS. Its bundled precision-math libraries
# pin it to GCC — qcdloop needs GCC's quadmath.h / libquadmath / __float128
# (unsupported by Apple clang on arm64) and qd's configure fails under
# AppleClang — while its std::-typed CXX_Interface (consumed by Sherpa) wants
# the stack's AppleClang/libc++, so neither all-clang nor all-GNU is clean.
# Gate it off on Darwin (empty package via the guards below + MakeModule) so a
# whole-stack macOS build doesn't fail on it; consumers gate the edge with
# "mcfm:(?!osx)". Builds normally on Linux. Remove the guards to resume the port.
##############################
function Configure() {
  [ "$(uname)" = Darwin ] && { mkdir -p "${INSTALLROOT}"; return 0; }
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path="${LHAPDF_ROOT}/include" \
    -Dwith_library=ON
}
function Make() {
  [ "$(uname)" = Darwin ] && return 0
  # handyG (a CMake sub-project of MCFM) has a missing Fortran-module dependency:
  # under parallel make, gpl_module.f is compiled before maths_functions.mod has
  # finished being written, giving
  #   File 'build/maths_functions.mod' ... is not a GNU Fortran module file
  # Build only handyG (and its bundled qd) serially, then the rest of MCFM --
  # which parallelises fine (e.g. vvamp) -- with the full job count. If the
  # 'handyg' target name is ever unavailable, fall back to a fully serial build
  # (the known-good behaviour) rather than failing.
  if cmake --build . --target handyg -- -j1; then
    cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
  else
    echo "bits: 'handyg' target unavailable; falling back to a full serial build" >&2
    cmake --build . -- ${CMAKE_OPTIONS} -j1
  fi
}
function MakeInstall() {
  [ "$(uname)" = Darwin ] && return 0
  cmake --install .
}
function PostInstall() {
  [ "$(uname)" = Darwin ] && return 0
  # MCFM's own cmake install does not expose the library/headers the way
  # consumers expect (Sherpa's FindMCFM searches for MCFM/CXX_Interface.h and a
  # library named 'mcfm' or 'MCFM'). Mirror lcgcmake: install the CXX interface
  # headers under include/MCFM and the library under BOTH names. PostInstall runs
  # in the build directory, so search it (and the install lib) for libmcfm.so.
  mkdir -p "${INSTALLROOT}/include" "${INSTALLROOT}/lib"
  [ -d "${SOURCEDIR}/src/Inc/MCFM" ] && cp -rf "${SOURCEDIR}/src/Inc/MCFM" "${INSTALLROOT}/include/"
  local _ext _lib
  _ext=so; [ "$(uname)" = Darwin ] && _ext=dylib
  _lib="$(find . "${INSTALLROOT}/lib" \( -name 'libmcfm.so' -o -name 'libmcfm.dylib' \) -print -quit 2>/dev/null)"
  if [ -n "${_lib}" ]; then
    cp -f "${_lib}" "${INSTALLROOT}/lib/libmcfm.${_ext}"
    cp -f "${_lib}" "${INSTALLROOT}/lib/libMCFM.${_ext}"
  fi
}
