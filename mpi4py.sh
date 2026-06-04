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
  # mpi4py is a compiled C extension that must link against the bits openmpi.
  # The mpicc wrapper stores its installation prefix at compile time; when bits
  # deploys openmpi to sw/ (a different path from the build INSTALLROOT) the
  # wrapper can no longer find mpicc-wrapper-data.txt.  Setting OPAL_PREFIX
  # overrides the compiled-in prefix so the wrapper locates its data files.
  export MPICC="${OPENMPI_ROOT}/bin/mpicc"
  export MPICXX="${OPENMPI_ROOT}/bin/mpicxx"
  export OPAL_PREFIX="${OPENMPI_ROOT}"
}