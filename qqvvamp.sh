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
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # qqvvamp is a single huge machine-generated translation unit. Under the -dbg
  # profile the inherited CXXFLAGS carry full '-g', so libqqvvamp.so's
  # .debug_loclists/.debug_info sections overflow the 32-bit relocation range and
  # the link dies with "relocation truncated to fit: R_X86_64_32 against
  # `.debug_info'". Cap debug to -g1 (no location lists -> no overflowing
  # relocations, and no var-tracking blow-up either) for this generated code,
  # where full local-variable debug info has no value. -g1 wins over any earlier
  # -g in CXXFLAGS; drop to -g0 if a future revision still overflows.
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
