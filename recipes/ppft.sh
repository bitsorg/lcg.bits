package: ppft
description: ppft distributed and parallel Python
version: "1.7.7"
tag: "1.7.7"
requires:
  - Python
  - dill
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