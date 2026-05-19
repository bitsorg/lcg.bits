package: ndindex
description: ndindex Python NumPy-style index manipulation library
version: "1.8"
tag: "1.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ndindex-1.8.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################