package: numba_stats
description: numba-stats numba-accelerated statistical functions
version: "1.10.1"
tag: "1.10.1"
requires:
  - Python
  - numba
  - numpy
  - scipy
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