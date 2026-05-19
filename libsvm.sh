package: libsvm
description: LIBSVM library for support vector machines
version: "3.23"
tag: "3.23"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libsvm-3.23.tar.gz
requires:
  - Python
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