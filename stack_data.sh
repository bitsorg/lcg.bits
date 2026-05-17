package: stack_data
description: stack_data extract data from Python stack frames
version: "0.6.3"
tag: "0.6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stack_data-0.6.3.tar.gz
requires:
  - Python
  - pip
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