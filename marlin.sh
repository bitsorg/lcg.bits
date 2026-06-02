package: marlin
description: Marlin modular analysis and reconstruction framework for ILC
version: "01.19.06"
tag: "v01-19-06"
source: https://github.com/iLCSoft/marlin.git
requires:
  - CMake
  - LCIO
  - ilcutil
  - gear
  - lccd
  - raida
  # Marlin's CMake has OPTION(MARLIN_CLHEP ... ON) and FIND_PACKAGE(CLHEP),
  # SEND_ERROR-ing if absent, so CLHEP must be in the build closure.
  - clhep
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
  # MARLIN_AIDA defaults ON: Marlin then does FIND_PACKAGE(AIDA) and SEND_ERRORs
  # if not found ("AIDA not found ..."). AIDA 3.2.1 ships no AIDAConfig.cmake, so
  # config-mode find_package(AIDA) can only succeed via a FindAIDA.cmake module +
  # aida-config, which the current ilcutil/AIDA no longer provides — so the build
  # aborts. AIDA in Marlin is legacy/optional (no package in this stack uses the
  # AIDAProcessor), so disable it. CLHEP/LCCD stay enabled and are satisfied by
  # the clhep/lccd dependencies (both ship CMake configs).
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DMARLIN_AIDA=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
