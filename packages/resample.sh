package: resample
description: resample resampling algorithms for Python
version: "1.10.1"
tag: "1.10.1"
requires:
  - Python
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