package: zict
description: zict mutable mapping tools for Dask
version: "3.0.0"
tag: "3.0.0"
requires:
  - Python
  - HeapDict
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