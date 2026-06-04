package: h11
description: h11 pure-Python HTTP/1.1 protocol implementation
version: "0.16.0"
tag: "0.16.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################