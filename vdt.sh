package: vdt
description: VDT vectorised math functions (CERN)
version: "0.4.4"
source: https://github.com/dpiparo/vdt
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - vdt-0.4.4.patch
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
function Configure() {
  # VDT enables SSE by default and injects -msse, which clang rejects on arm64
  # ("unsupported option '-msse'"). Disable the x86 ISA options on ARM; VDT then
  # builds its scalar signatures. (Unknown options are ignored by older VDT.)
  local _isa=""
  case "$(uname -m)" in
    arm64|aarch64) _isa="-DSSE=OFF -DAVX=OFF -DAVX2=OFF -DFMA=OFF" ;;
  esac
  cmake -S "$BITS_CMAKE_SRC" -B "$BITS_CMAKE_BUILD" \
    -DCMAKE_INSTALL_PREFIX="${INSTALLROOT}" \
    ${CMAKE_PREFIX_PATH:+-DCMAKE_PREFIX_PATH="${CMAKE_PREFIX_PATH}"} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    ${_isa}
}
