package: ggvvamp
description: gg→VV amplitude library for loop-induced processes
version: "1.0.atlas1"
tag: "1.0.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ginac
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-GGVVAMP
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # ggvvamp is huge machine-generated TUs (p0NNN.cpp). Full '-g' from the -dbg
  # profile overflows var-tracking and the 32-bit .debug_* relocation range, so
  # cap to -g1 (wins over earlier -g; drop to -g0 if it still overflows).
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
