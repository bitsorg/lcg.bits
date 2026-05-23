package: nodejs
description: Node.js JavaScript runtime built on V8
version: "22.14.0"
tag: "22.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/node-v22.14.0.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  # GCC 15 defaults to gnu++23; V8's ##__VA_ARGS__ macros only work correctly
  # under gnu++17 semantics.  Force C++17 for the whole build.
  CXXFLAGS="-std=gnu++17" \
  ./configure --prefix "$INSTALLROOT"
}
