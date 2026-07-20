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
# CPC Program Library non-profit licence — no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
patches:
  - babayaga-fcc1.0.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# babayaga's nested CMake (bundled recola/COLLIER) predates the CMake >= 4 policy
# floor, so it fails. A top-level -D can't reach it; export
# CMAKE_POLICY_VERSION_MINIMUM, which every cmake invocation honours.
export CMAKE_POLICY_VERSION_MINIMUM=3.5
##############################
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  # MakeRecipe builds out-of-source, so the linked executable is in the build dir
  # (cwd), not $SOURCEDIR. Locate it in the build tree.
  local bin
  bin=$(find . -maxdepth 3 -name babayaga-fcc -type f | head -1)
  : "${bin:?babayaga-fcc was not produced by the build}"
  chmod +x "$bin"
  cp "$bin" "$INSTALLROOT/bin/"
}
