package: logical_unification
description: logical-unification unification of Python objects
version: "0.4.6"
tag: "0.4.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/logical-unification-0.4.6.tar.gz
requires:
  - Python
  - pip
  - toolz
  - multipledispatch
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################