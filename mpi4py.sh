package: mpi4py
description: mpi4py MPI for Python bindings
version: "4.0.3"
tag: "4.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpi4py-4.0.3.tar.gz
requires:
  - Python
  - setuptools
  - openmpi
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################