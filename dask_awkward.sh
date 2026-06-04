package: dask_awkward
description: dask-awkward Dask collections for Awkward Arrays
version: "2025.9.0"
tag: "2025.9.0"
requires:
  - Python
  - dask
  - awkward
  - typing_extensions
  - cachetools
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