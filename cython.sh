package: cython
description: Cython C-extensions for Python compiler
version: "3.2.4"
tag: "3.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cython-3.2.4.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################