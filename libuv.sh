package: libuv
description: libuv cross-platform asynchronous I/O library
version: "1.44.2"
source: https://github.com/libuv/libuv
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libuv-v1.44.2.tar.gz
requires:
  - CMake
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
references:
  - cpe:2.3:a:libuv:libuv:%(version)s
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pkgconfig --cmake"
##############################
