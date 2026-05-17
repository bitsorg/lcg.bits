package: dask_histogram
description: dask-histogram Dask parallelised boost-histogram
version: "2025.2.0"
tag: "2025.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dask_histogram-2025.2.0.tar.gz
requires:
  - Python
  - pip
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################