package: mpi4py
description: mpi4py MPI for Python bindings
version: "4.0.3"
tag: "4.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - openmpi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
  - cython
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
function Configure() {
  # mpicc stores its prefix at compile time; bits deploys openmpi to a different
  # path, so set OPAL_PREFIX to override it and let the wrapper find its data files.
  export MPICC="${OPENMPI_ROOT}/bin/mpicc"
  export MPICXX="${OPENMPI_ROOT}/bin/mpicxx"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
}