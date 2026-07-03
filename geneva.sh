package: geneva
description: Geneva stochastic global optimisation framework
version: "1.0-rc3.atlas2"
tag: "1.0-rc3.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/geneva-1.0-rc3.tar.gz
requires:
  - CMake
  - lhapdf
  - openloops
  - zlib
  - GSL
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - geneva-1.0-rc3.atlas2.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# macOS: Geneva's Python extension is built by setup.py, which invokes Apple
# clang without -isysroot, so it can't find the SDK's libc++ headers. Export
# SDKROOT (clang's fallback sysroot) at recipe scope so the Make step picks it up.
bits_is_macos && export SDKROOT="$(xcrun --show-sdk-path 2>/dev/null)"
##############################
function Configure() {
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Dgeneva_enable_hepmc=OFF \
    -Dgeneva_enable_lhapdf=ON \
    -Dgeneva_enable_openloops=ON \
    -Dgeneva_enable_pythia8=OFF \
    -Dgeneva_enable_python=ON \
    -Dopenloops_ROOT="${OPENLOOPS_ROOT}" \
    -Dlhapdf_ROOT="${LHAPDF_ROOT}"
}
function Make() {
  # Build in the out-of-source binary dir, not cwd (the source copy): geneva
  # configures with cmake -B "$BITS_CMAKE_BUILD", so the Makefile lives there.
  make -C "$BITS_CMAKE_BUILD" ${JOBS:+-j $JOBS} beamfunc-install-data
  make -C "$BITS_CMAKE_BUILD" ${JOBS:+-j $JOBS}
}
