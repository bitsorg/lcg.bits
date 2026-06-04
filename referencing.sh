package: referencing
description: referencing Python JSON Schema referencing implementation
version: "0.35.1"
tag: "0.35.1"
requires:
  - Python
  - rpds_py
  - attrs
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