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
  # ggvvamp is a set of huge machine-generated translation units (p0NNN.cpp).
  # Under the -dbg profile the inherited CXXFLAGS carry full '-g', which triggers
  # "variable tracking size limit exceeded" and, at link, .debug_* sections that
  # overflow the 32-bit relocation range ("relocation truncated to fit:
  # R_X86_64_32 against `.debug_info'"). Cap debug to -g1 (no location lists, no
  # var-tracking) for this generated code, where full debug info has no value.
  # -g1 wins over any earlier -g in CXXFLAGS; drop to -g0 if it still overflows.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
