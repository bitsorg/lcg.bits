package: cloudpickle
description: cloudpickle extended pickling support for Python objects
version: "3.1.1"
tag: "3.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cloudpickle-3.1.1.tar.gz
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