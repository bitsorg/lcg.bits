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
# academic-use licence with no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: none
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # ggvvamp is huge machine-generated code; full '-g' from the -dbg profile
  # overflows the 32-bit relocation range for .debug_* sections. Cap debug to -g1
  # (wins over earlier -g); drop to -g0 if it still overflows.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
