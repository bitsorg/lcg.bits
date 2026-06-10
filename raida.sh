package: raida
description: RAIDA ROOT-based implementation of the AIDA analysis interface
version: "01.12"
tag: "v01-12"
source: https://github.com/iLCSoft/RAIDA.git
requires:
  - CMake
  - ilcutil
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
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
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function PostInstall() {
  # AIDAConfig.cmake INCLUDEs RAIDAConfig.cmake via a hardcoded @CMAKE_INSTALL_PREFIX@
  # path that doesn't exist (configs land in lib/cmake/RAIDA/), breaking find_package(AIDA)
  # consumers (Marlin). Repoint it at the sibling via relocation-safe CMAKE_CURRENT_LIST_DIR.
  local _aida
  _aida="$(find "${INSTALLROOT}" -name AIDAConfig.cmake -print -quit 2>/dev/null)"
  if [ -n "${_aida}" ]; then
    perl -i -pe 's#INCLUDE\( *"[^"]*/RAIDAConfig.cmake" *\)#INCLUDE( "\${CMAKE_CURRENT_LIST_DIR}/RAIDAConfig.cmake" )#' "${_aida}"
  fi
}
