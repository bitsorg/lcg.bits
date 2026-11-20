package: k4simgeant4
description: Key4hep Geant4 full simulation framework
version: "0.1.0pre17"
tag: "v0.1.0pre17"
source: https://github.com/key4hep/k4SimGeant4.git
requires:
  - CMake
  - k4fwcore
  - DD4hep
  - Geant4
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function SetBuildEnv() {
  _SetBuildEnvBase
  # genconf dlopens SimG4Components, triggering Geant4 static initialisers that
  # abort unless the Geant4 data env vars are set - and its runtime modulefile
  # doesn't reach the build env. Source Geant4's env script, else set G4ENSDFSTATEDATA.
  if [ -f "${GEANT4_ROOT}/bin/geant4.sh" ]; then
    . "${GEANT4_ROOT}/bin/geant4.sh" || true
  fi
  if [ -z "${G4ENSDFSTATEDATA:-}" ]; then
    _g4ensdf=$(ls -d "${GEANT4_ROOT}"/share/Geant4*/data/G4ENSDFSTATE* 2>/dev/null | head -1)
    [ -n "${_g4ensdf}" ] && export G4ENSDFSTATEDATA="${_g4ensdf}"
  fi
}
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DBUILD_DOCS=OFF \
    -DPython_ROOT_DIR="${Python_ROOT}" \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
