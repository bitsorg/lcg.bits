package: k4geo
description: Key4hep detector geometry descriptions (DD4hep)
version: "00.24"
tag: "v00-24"
source: https://github.com/key4hep/k4geo.git
requires:
  - CMake
  - DD4hep
  - EDM4hep
  - LCIO
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
  # The dual-readout-calorimeter EDM4hep output plugin
  # (plugins/Geant4Output2EDM4hep_DRC.cpp) uses a podio Frame API newer than
  # podio 01.07 -- Frame::put(Collection) and Frame::putParameter(name, int)
  # signatures that don't exist in this stack's podio -- so it fails to compile
  # while the rest of k4geo (main lib + all other G4 plugins) builds fine. It's a
  # niche DRC-only writer; drop just that one file from the G4 plugin list. The
  # sed is idempotent (no-op once the line is gone) and guarded so a future
  # upstream rename can't silently re-introduce the failure unnoticed.
  if grep -q 'plugins/Geant4Output2EDM4hep_DRC.cpp' "${SOURCEDIR}/CMakeLists.txt"; then
    sed -i '\#\./plugins/Geant4Output2EDM4hep_DRC\.cpp#d' "${SOURCEDIR}/CMakeLists.txt"
  fi
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DINSTALL_COMPACT_FILES=ON \
    -DINSTALL_BEAMPIPE_STL_FILES=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
