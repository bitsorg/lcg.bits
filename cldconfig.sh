package: cldconfig
description: cldconfig dynamic linker configuration utility
# CLDConfig follows the Key4hep nightlies and has no stable release tag, so
# track the default branch (matches --defaults dev4 / HEAD).
version: "main"
tag: "main"
source: https://github.com/key4hep/CLDConfig.git
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
