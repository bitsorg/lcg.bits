package: clhep
description: Class Library for High Energy Physics
version: "2.4.7.2"
source: https://gitlab.cern.ch/CLHEP/CLHEP
tag: "CLHEP_2_4_7_2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tgz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-only
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
