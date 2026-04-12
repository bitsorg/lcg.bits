package: mpi4py
description: mpi4py Python package
version: "4.0.3"
tag: "4.0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpi4py-4.0.3.tar.gz
requires:
  - Python
  - setuptools
  - openmpi
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