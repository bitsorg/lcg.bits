package: hdf5
description: HDF5 hierarchical data format library for large datasets
version: "1.14.6"
tag: "1.14.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hdf5-1.14.6.tar.gz
requires:
  - zlib
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
