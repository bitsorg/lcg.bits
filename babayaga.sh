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
# babayaga's Makefile builds a bundled recola/COLLIER via a *nested* CMake whose
# cmake_minimum_required() predates the floor CMake >= 4 accepts, so the nested
# configure fails ("Compatibility with CMake < 3.5 has been removed"). A
# top-level -D cannot reach the nested cmake, but the CMAKE_POLICY_VERSION_MINIMUM
# environment variable is honoured by every cmake invocation (CMake 3.31+), so
# export it for the whole build.
export CMAKE_POLICY_VERSION_MINIMUM=3.5
##############################
function Make() {
  # arm64 (Apple Silicon): the Makefile hardcodes RLXOPT=-DSSE2, which selects
  # c_ranlux's x86 SSE inline assembly (xmm registers). Those registers do not
  # exist on arm64, so the build fails ("unknown register name 'xmm3' in asm").
  # Override RLXOPT to empty so the portable C fallback (the #else branch in
  # ranlux_common.c) is compiled instead. x86 hosts (Linux) keep -DSSE2.
  local _rlx=()
  case "$(uname -m)" in
    arm64 | aarch64) _rlx=(RLXOPT=) ;;
  esac
  make ${JOBS:+-j $JOBS} "${_rlx[@]}"
}
##############################
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  # MakeRecipe builds out-of-source: Prepare() rsyncs $SOURCEDIR into the build
  # directory and make runs there, so the linked executable is in the build dir
  # (cwd), not $SOURCEDIR. Locate it in the build tree.
  local bin
  bin=$(find . -maxdepth 3 -name babayaga-fcc -type f | head -1)
  : "${bin:?babayaga-fcc was not produced by the build}"
  chmod +x "$bin"
  cp "$bin" "$INSTALLROOT/bin/"
}
