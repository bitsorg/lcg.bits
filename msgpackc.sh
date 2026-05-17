package: msgpackc
description: MessagePack C/C++ serialization library
version: "3.2.0"
tag: "3.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/msgpack-c-cpp-3.2.0.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
