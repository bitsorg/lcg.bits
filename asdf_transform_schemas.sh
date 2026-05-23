package: asdf_transform_schemas
description: ASDF transform schema definitions
version: "0.5.0"
tag: "0.5.0"
requires:
  - Python
  - asdf_standard
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################