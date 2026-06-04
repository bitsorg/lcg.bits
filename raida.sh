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
  # RAIDA's generated AIDAConfig.cmake pulls in RAIDAConfig.cmake via
  # INCLUDE("@CMAKE_INSTALL_PREFIX@/RAIDAConfig.cmake"), but the config files are
  # actually installed under lib/cmake/RAIDA/. The hardcoded prefix path doesn't
  # exist, so every consumer that does find_package(AIDA) — all of Marlin via
  # MARLIN_AIDA=ON — fails with "INCLUDE could not find requested file". Repoint
  # the include at the sibling RAIDAConfig.cmake using CMAKE_CURRENT_LIST_DIR,
  # which is resolved when the consumer loads the config and is relocation-safe.
  local _aida
  _aida="$(find "${INSTALLROOT}" -name AIDAConfig.cmake -print -quit 2>/dev/null)"
  if [ -n "${_aida}" ]; then
    sed -i 's#INCLUDE( *"[^"]*/RAIDAConfig.cmake" *)#INCLUDE( "${CMAKE_CURRENT_LIST_DIR}/RAIDAConfig.cmake" )#' "${_aida}"
  fi
}
