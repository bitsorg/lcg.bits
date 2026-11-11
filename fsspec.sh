package: fsspec
description: fsspec filesystem interfaces for Python
version: "2026.6.0"
tag: "2026.6.0"
requires:
  - Python
  - panel
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