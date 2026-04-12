package: pytables
description: pytables Python package
version: "3.10.2"
tag: "3.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tables-3.10.2.tar.gz
requires:
  - Python
  - numpy
  - numexpr
  - hdf5
  - xz
  - cython
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