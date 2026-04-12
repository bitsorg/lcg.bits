package: hdf5_mpi
description: hdf5_mpi library/tool (from LCG software stack)
version: "1.14.6"
tag: "1.14.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hdf5-1.14.6.tar.gz
requires:
  - zlib
  - openmpi
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
