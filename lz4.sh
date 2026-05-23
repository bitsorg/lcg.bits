package: lz4
description: LZ4 extremely fast lossless compression library
version: "1.10.0"
tag: "1.10.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
prefer_system: osx.*
prefer_system_check: |
  printf "#include <lz4.h>\n" | cc -xc -I$(brew --prefix lz4)/include - -c -M 2>&1

requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
