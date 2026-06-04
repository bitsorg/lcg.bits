package: numcodecs
description: numcodecs buffer compression and transformation codecs
version: "0.16.5"
tag: "0.16.5"
requires:
  - Python
  - cython
  - numpy
  - entrypoints
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
