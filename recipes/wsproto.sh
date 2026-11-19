package: wsproto
description: wsproto pure-Python WebSocket/HTTP implementation
version: "1.2.0"
tag: "1.2.0"
requires:
  - Python
  - h11
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