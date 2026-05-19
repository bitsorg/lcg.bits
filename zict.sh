package: zict
description: zict mutable mapping tools for Dask
version: "3.0.0"
tag: "3.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zict-3.0.0.tar.gz
requires:
  - Python
  - pip
  - HeapDict
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