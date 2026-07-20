package: qqvvamp
description: qq→VV amplitude library for EW boson pair production
version: "1.1.atlas1"
tag: "1.1.atlas1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - ginac
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-QQVVAMP
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
  # qqvvamp is one huge machine-generated TU; under -dbg full '-g' overflows the 32-bit
  # relocation range (.debug_info) and the link dies "relocation truncated to fit". Cap
  # debug at -g1 (wins over earlier -g); drop to -g0 if a future revision still overflows.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
