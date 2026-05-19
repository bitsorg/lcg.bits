package: alabaster
description: Alabaster clean Sphinx documentation theme
version: "1.0.0"
tag: "1.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/alabaster-1.0.0.tar.gz
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