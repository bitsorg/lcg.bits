package: dask_histogram
description: dask-histogram Dask parallelised boost-histogram
version: "2025.2.0"
tag: "2025.2.0"
requires:
  - Python
  - dask
  - boost_histogram
  - dask_awkward
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