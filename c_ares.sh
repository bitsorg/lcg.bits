package: c_ares
description: c-ares asynchronous DNS resolver library
version: "1.34.3"
source: https://github.com/c-ares/c-ares
tag: "cares-1_34_3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/c-ares-1.34.3.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - cpe:2.3:a:c-ares:c-ares:%(version)s
  - cpe:2.3:a:c-ares_project:c-ares:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --cmake"
##############################
