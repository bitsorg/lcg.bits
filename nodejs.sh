package: nodejs
description: Node.js JavaScript runtime built on V8
version: "24.16.0"
tag: "v24.16.0"
source: https://github.com/nodejs/node.git
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
    CXXFLAGS="-fPIC -g -O2 -std=gnu++17" \
    ./configure --prefix "$INSTALLROOT"
}
