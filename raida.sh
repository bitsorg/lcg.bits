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
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=17 \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
function MakeInstall() {
  # ilcutil's GENERATE_PACKAGE_CONFIGURATION_FILES emits RAIDALibDeps.cmake via the
  # legacy export_library_dependencies() command, a NO-OP in CMake 3.30 (CMP0033),
  # so the file is never generated though the install rule + RAIDAConfig.cmake's
  # INCLUDE reference it. Stub it empty (legacy link-dep tracking, unused by modern
  # target-based find_package) so install and find_package(RAIDA/AIDA) succeed.
  : > "$BITS_CMAKE_BUILD/RAIDALibDeps.cmake"
  cmake --install "$BITS_CMAKE_BUILD"
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
