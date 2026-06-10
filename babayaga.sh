package: babayaga
description: BabaYaga NLO Monte Carlo generator for e+e- radiative processes
version: "fcc1.0.0"
tag: "fcc1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.bz2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-BabaYaga
patches:
  - babayaga-fcc1.0.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# babayaga's bundled recola/COLLIER uses a nested CMake whose
# cmake_minimum_required() predates the floor CMake >= 4 accepts. A top-level -D
# can't reach it, so export CMAKE_POLICY_VERSION_MINIMUM (honoured by all cmake).
export CMAKE_POLICY_VERSION_MINIMUM=3.5
##############################
function Make() {
  # arm64: the Makefile hardcodes RLXOPT=-DSSE2, selecting c_ranlux's x86 SSE
  # asm (xmm registers) that don't exist on arm64. Empty RLXOPT so the portable
  # C fallback in ranlux_common.c is compiled; x86 keeps -DSSE2.
  local _rlx=()
  case "$(uname -m)" in
    arm64 | aarch64) _rlx=(RLXOPT=) ;;
  esac
  make ${JOBS:+-j $JOBS} "${_rlx[@]}"
}
##############################
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  # MakeRecipe builds out-of-source, so the linked executable lands in the build
  # dir (cwd), not $SOURCEDIR. Locate it in the build tree.
  local bin
  bin=$(find . -maxdepth 3 -name babayaga-fcc -type f | head -1)
  : "${bin:?babayaga-fcc was not produced by the build}"
  chmod +x "$bin"
  cp "$bin" "$INSTALLROOT/bin/"
}
