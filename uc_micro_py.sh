package: uc_micro_py
description: uc-micro-py micro subset of Unicode data for Python
version: "1.0.2"
tag: "1.0.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/uc-micro-py-1.0.2.tar.gz
requires:
  - Python
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