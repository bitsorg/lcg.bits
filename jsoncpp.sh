package: jsoncpp
description: JsonCpp JSON parser and generator for C++
version: "1.9.3"
tag: "1.9.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jsoncpp-1.9.3.zip
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
function Configure() {
  cmake \
    -DBUILD_SHARED_LIBS=ON
}
