package: dask_jobqueue
description: dask-jobqueue deploy Dask on HPC job schedulers
version: "0.9.0"
tag: "0.9.0"
requires:
  - Python
  - dask
  - distributed
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