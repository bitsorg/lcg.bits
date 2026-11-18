package: jsonschema_specifications
description: jsonschema-specifications JSON Schema meta-schemas
version: "2023.7.1"
tag: "2023.7.1"
requires:
  - Python
  - referencing
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