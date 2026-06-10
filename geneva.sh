package: geneva
description: Geneva stochastic global optimisation framework
version: "1.0-rc3.atlas2"
tag: "1.0-rc3.atlas2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/geneva-1.0-rc3.tar.gz
requires:
  - CMake
  - lhapdf
  # Gated behind the `openloops` flavour (off by default); see sherpa.sh.
  - "openloops:(?openloops)"
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
  # OpenLoops is gated behind the `openloops` flavour. When off, OPENLOOPS_ROOT
  # is unset; disable it in CMake and drop the openloops_ROOT hint.
  local _ol=OFF; [ -n "${OPENLOOPS_ROOT:-}" ] && _ol=ON
  cmake "${SOURCEDIR}" \
      -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
      -DCMAKE_BUILD_TYPE=Release \
    -Dgeneva_enable_hepmc=OFF \
    -Dgeneva_enable_lhapdf=ON \
    -Dgeneva_enable_openloops=$_ol \
    -Dgeneva_enable_pythia8=OFF \
    -Dgeneva_enable_python=ON \
    ${OPENLOOPS_ROOT:+-Dopenloops_ROOT="${OPENLOOPS_ROOT}"} \
    -Dlhapdf_ROOT="${LHAPDF_ROOT}"
}
function Make() {
  make ${JOBS:+-j $JOBS} beamfunc-install-data
make ${JOBS:+-j $JOBS}
}
