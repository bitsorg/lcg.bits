package: dask_histogram
description: dask_histogram Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################