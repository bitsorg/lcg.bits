package: cppy
description: cppy C++ support library for writing Python extension modules
version: "1.2.1"
tag: "1.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cppy-1.2.1.tar.gz
requires:
  - Python
  - setuptools
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