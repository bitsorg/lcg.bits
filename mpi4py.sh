package: mpi4py
description: mpi4py MPI for Python bindings
version: "4.0.3"
source: https://github.com/mpi4py/mpi4py
tag: "%(version)s"
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
  # mpi4py is a compiled C extension linking the bits openmpi. The mpicc wrapper
  # stores its install prefix at compile time; when bits deploys openmpi to sw/
  # (different from build INSTALLROOT) it loses its data files. OPAL_PREFIX fixes it.
  export MPICC="${OPENMPI_ROOT}/bin/mpicc"
  export MPICXX="${OPENMPI_ROOT}/bin/mpicxx"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
}