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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# macOS: not ported. qcdloop needs GCC quadmath/__float128 (no Apple clang
# arm64) while the std:: CXX_Interface wants libc++, so neither toolchain is
# clean. Gate off (empty package via the guards below); consumers gate the edge
# "mcfm:(?!osx)". Remove the guards to resume the port.
##############################
function Configure() {
  bits_is_macos && { mkdir -p "${INSTALLROOT}"; return 0; }
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path="${LHAPDF_ROOT}/include" \
    -Dwith_library=ON
}
function Make() {
  bits_is_macos && return 0
  # handyG has a missing Fortran-module dep that breaks parallel make; build it
  # (and its bundled qd) serially, then the rest with full -j. Fall back to a
  # fully serial build if the 'handyg' target is unavailable.
  if cmake --build . --target handyg -- -j1; then
    cmake --build . -- ${CMAKE_OPTIONS} ${JOBS:+-j$JOBS}
  else
    echo "bits: 'handyg' target unavailable; falling back to a full serial build" >&2
    cmake --build . -- ${CMAKE_OPTIONS} -j1
  fi
}
function MakeInstall() {
  bits_is_macos && return 0
  cmake --install .
}
function PostInstall() {
  bits_is_macos && return 0
  # MCFM's install doesn't expose the lib/headers as Sherpa's FindMCFM expects;
  # mirror lcgcmake: install CXX_Interface headers under include/MCFM and the lib
  # under both libmcfm and libMCFM.
  mkdir -p "${INSTALLROOT}/include" "${INSTALLROOT}/lib"
  [ -d "${SOURCEDIR}/src/Inc/MCFM" ] && cp -rf "${SOURCEDIR}/src/Inc/MCFM" "${INSTALLROOT}/include/"
  local _ext _lib
  _ext=so; bits_is_macos && _ext=dylib
  _lib="$(find . "${INSTALLROOT}/lib" \( -name 'libmcfm.so' -o -name 'libmcfm.dylib' \) -print -quit 2>/dev/null)"
  if [ -n "${_lib}" ]; then
    cp -f "${_lib}" "${INSTALLROOT}/lib/libmcfm.${_ext}"
    cp -f "${_lib}" "${INSTALLROOT}/lib/libMCFM.${_ext}"
  fi
}
