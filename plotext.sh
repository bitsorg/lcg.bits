package: plotext
description: plotext plots data directly on terminal
version: "5.2.7"
tag: "5.2.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/plotext-5.2.7.tar.gz
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