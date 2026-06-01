package: g4hepem
description: G4HepEm EM physics tabulation library for Geant4
version: "20251114"
tag: "20251114"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Geant4
  # CUDA is pulled in only for --defaults cuda builds (arch tagged -cuda).
  - "cuda:.*-cuda$"
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
function Configure() {
  # Build the CUDA backend only under --defaults cuda. ENABLE_CUDA is set
  # (to ON) by defaults-cuda; an unset value is treated as OFF.
  local cuda_opts=()
  if [ "${ENABLE_CUDA:-OFF}" = "ON" ]; then
    cuda_opts+=(-DG4HepEm_CUDA_BUILD=ON)
    [ -n "${CMAKE_CUDA_ARCHITECTURES:-}" ] && cuda_opts+=(-DCMAKE_CUDA_ARCHITECTURES="${CMAKE_CUDA_ARCHITECTURES}")
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    "${cuda_opts[@]}" \
    -DCMAKE_CXX_STANDARD=17 \
    -DG4HepEm_EARLY_TRACKING_EXIT=ON
}
