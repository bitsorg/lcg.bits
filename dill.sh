package: dill
description: dill extends Python's pickle for serializing lambdas etc.
version: "0.4.0"
tag: "0.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dill-0.4.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################