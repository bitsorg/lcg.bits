package: pythran
description: Pythran ahead-of-time compiler for Python scientific code
version: "0.17.0"
tag: "0.17.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pythran-0.17.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - beniget
  - gast
  - numpy
  - ply
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - pythran-0.17.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################