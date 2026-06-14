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
  # The DRC EDM4hep output plugin (Geant4Output2EDM4hep_DRC.cpp) uses a podio Frame
  # API newer than this stack's podio 01.07, so it fails to compile. Drop just that
  # niche DRC-only file from the G4 plugin list (grep-guarded, idempotent).
  if grep -q 'plugins/Geant4Output2EDM4hep_DRC.cpp' "${SOURCEDIR}/CMakeLists.txt"; then
    perl -i -ne 'print unless m#\./plugins/Geant4Output2EDM4hep_DRC\.cpp#' "${SOURCEDIR}/CMakeLists.txt"
  fi
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=${CXXSTD:-20} \
    -DBUILD_TESTING=OFF \
    -DINSTALL_COMPACT_FILES=ON \
    -DINSTALL_BEAMPIPE_STL_FILES=ON \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION="${ENABLE_IPO}"
}
