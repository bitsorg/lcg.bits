package: mpi4py
description: mpi4py MPI for Python bindings
version: "4.0.3"
tag: "4.0.3"
requires:
  - Python
  - openmpi
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################