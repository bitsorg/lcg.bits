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
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin"
  chmod +x "$SOURCEDIR/babayaga-fcc"
  cp "$SOURCEDIR/babayaga-fcc" "$INSTALLROOT/bin/"
}
