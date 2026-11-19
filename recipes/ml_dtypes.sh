package: ml_dtypes
description: ml_dtypes ML-specific NumPy dtypes (bfloat16, float8 etc.)
version: "0.5.1"
tag: "0.5.1"
requires:
  - Python
  - numpy
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################