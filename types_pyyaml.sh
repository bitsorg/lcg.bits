package: types_pyyaml
description: types-PyYAML type stubs for PyYAML
version: "6.0.12.20241230"
tag: "6.0.12.20241230"
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