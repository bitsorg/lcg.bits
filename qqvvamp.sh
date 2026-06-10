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
  # qqvvamp is one huge machine-generated TU; under -dbg the inherited full '-g'
  # overflows the 32-bit reloc range (R_X86_64_32 against .debug_info). Cap to -g1
  # (no location lists) for this generated code; drop to -g0 if it still overflows.
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -g1" \
    -DGiNaC_DIR="${GINAC_ROOT}"
}
