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
function Configure() {
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Duse_internal_lhapdf=OFF \
    -Dlhapdf_include_path="${LHAPDF_ROOT}/include" \
    -Dwith_library=ON
}
function PostInstall() {
  # MCFM's own cmake install does not expose the library/headers the way
  # consumers expect (Sherpa's FindMCFM searches for MCFM/CXX_Interface.h and a
  # library named 'mcfm' or 'MCFM'). Mirror lcgcmake: install the CXX interface
  # headers under include/MCFM and the library under BOTH names. PostInstall runs
  # in the build directory, so search it (and the install lib) for libmcfm.so.
  mkdir -p "${INSTALLROOT}/include" "${INSTALLROOT}/lib"
  [ -d "${SOURCEDIR}/src/Inc/MCFM" ] && cp -rf "${SOURCEDIR}/src/Inc/MCFM" "${INSTALLROOT}/include/"
  local _lib
  _lib="$(find . "${INSTALLROOT}/lib" -name 'libmcfm.so' -print -quit 2>/dev/null)"
  if [ -n "${_lib}" ]; then
    cp -f "${_lib}" "${INSTALLROOT}/lib/libmcfm.so"
    cp -f "${_lib}" "${INSTALLROOT}/lib/libMCFM.so"
  fi
}
