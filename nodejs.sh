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
