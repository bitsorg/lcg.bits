package: pytables
description: PyTables HDF5 tables package for managing large datasets
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
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################