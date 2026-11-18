package: railroad_diagrams
description: railroad-diagrams SVG railroad diagram generator
version: "1.1.1"
tag: "1.1.1"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: CC0-1.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################