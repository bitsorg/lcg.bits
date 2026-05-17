package: histoprint
description: histoprint pretty histogram printing in the terminal
version: "2.6.0"
tag: "2.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/histoprint-2.6.0.tar.gz
requires:
  - Python
  - pip
  - uhi
  - numpy
  - click
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