package: cycler
description: Cycler composable cycles for matplotlib property iteration
version: "0.12.1"
tag: "0.12.1"
requires:
  - Python
  - six
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