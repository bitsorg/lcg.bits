package: crmc
description: CRMC cosmic ray Monte Carlo interface package
version: "2.0.1p5"
tag: "2.0.1p5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/crmc.v2.0.1.tar.gz
requires:
  - CMake
  - Boost
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-CRMC
patches:
  - crmc-2.0.1p5.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # macOS: the EPOS Fortran objects in the CrmcBasic/Epos shared libraries
  # reference model routines (inimodel_, drangen_, crseaamodel_, ...) defined in
  # sibling model libraries and only resolved once CRMC loads them all together.
  # Linux's flat namespace allows such undefined symbols in a shared library;
  # macOS's two-level namespace rejects them at link ("symbol(s) not found for
  # architecture arm64"). Allow them to be resolved at load time
  # (-undefined dynamic_lookup), restoring the Linux behaviour, and reserve
  # Mach-O header pad for bits' install-name relocation. Applies to all SHARED
  # targets via CMAKE_SHARED_LINKER_FLAGS. Linux leaves it unset.
  local _lflags=()
  [ "$(uname)" = Darwin ] && _lflags=(-DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup -Wl,-headerpad_max_install_names")
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DBOOST_ROOT="${Boost_ROOT}" \
    -DBOOST_INCLUDE_DIR="${Boost_home_include}" \
    -DBoost_NO_SYSTEM_PATHS=TRUE \
    "${_lflags[@]}"
}
