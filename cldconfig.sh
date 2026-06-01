package: cldconfig
description: cldconfig dynamic linker configuration utility
version: "HEAD"
tag: "HEAD"
source: git+https://github.com/key4hep/CLDConfig.git?obj=main
requires:
  - CMake
  - k4fwcore
  - delphes
  - pythia8
  - hepmc3
  - evtgen
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
