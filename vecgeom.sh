package: VecGeom
description: Vectorized geometry library for particle-transport simulations
version: "2.0.0"
mem_per_job: 2048
mem_utilisation: 0.85
tag: "v2.0.0"
source: https://gitlab.cern.ch/VecGeom/VecGeom.git
requires:
  - CMake
  - Vc
  - veccore
  - XercesC
  # CUDA (conditional: only when defaults set variable `cuda` truthy):
  - "cuda:(?cuda)"
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
function Prepare() {
  # TEMP (until bits-recipe-tools v0.0.32 is pinned): keep .git in the copy. The
  # deployed CMakeRecipe (v0.0.31) strips it, but VecGeom derives PROJECT_VERSION
  # from `git describe`; without .git the version is empty and math() at
  # CMakeLists.txt:791 fails. v0.0.32 keeps .git in the framework; drop this then.
  rsync -a --delete --exclude '/bits-build/' "$SOURCEDIR"/ ./
}
function Configure() {
  # Enable the CUDA backend only under --defaults cuda. ENABLE_CUDA is set
  # (to ON) by defaults-cuda; an unset value is treated as OFF.
  local cuda_opts=()
  if [ "${ENABLE_CUDA:-OFF}" = "ON" ]; then
    cuda_opts+=(-DVECGEOM_ENABLE_CUDA=ON)
    [ -n "${CMAKE_CUDA_ARCHITECTURES:-}" ] && cuda_opts+=(-DCMAKE_CUDA_ARCHITECTURES="${CMAKE_CUDA_ARCHITECTURES}")
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    "${cuda_opts[@]}" \
    -DVECGEOM_GEANT4=OFF \
    -DVECGEOM_ROOT=OFF \
    -DVECGEOM_BUILTIN_VECCORE=OFF \
    -DVECGEOM_NAV=tuple \
    -DVECGEOM_NAVTUPLE_MAXDEPTH=4 \
    -DVECGEOM_USE_SURF=ON
}
function Make() {
  # Build only library targets; GDML test executables share names with their
  # source subdirectories, so the linker fails with "Is a directory" on GCC 15.
  cmake --build "$BITS_CMAKE_BUILD" --target vecgeom --target vgdml ${JOBS:+-- -j$JOBS}
}
