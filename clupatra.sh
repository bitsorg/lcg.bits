package: clupatra
description: Clupatra Kalman-filter track finding for ILC/CLICdp
version: "HEAD"
tag: "HEAD"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/clupatra-HEAD.tar.gz
requires:
  - CMake
  - ilcutil
  - marlin
  - marlinutil
  - GSL
  - DD4hep
  - ROOT
  - marlintrk
  - kaltest
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
