package: xdrlib3
description: xdrlib3 XDR data packing/unpacking for Python 3
version: "0.1.1"
tag: "0.1.1"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
