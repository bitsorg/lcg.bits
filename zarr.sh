package: zarr
description: zarr chunked, compressed N-dimensional arrays for Python
version: "3.0.0"
tag: "3.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zarr-3.0.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################