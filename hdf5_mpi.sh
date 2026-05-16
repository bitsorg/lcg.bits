package: hdf5_mpi
description: HDF5 library built with MPI parallel I/O support
version: "1.14.6"
tag: "1.14.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hdf5-1.14.6.tar.gz
requires:
  - zlib
  - openmpi
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
