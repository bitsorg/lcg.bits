package: dask_awkward
description: dask-awkward Dask collections for Awkward Arrays
version: "2025.9.0"
tag: "2025.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask_awkward-2025.9.0.tar.gz
requires:
  - Python
  - pip
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################