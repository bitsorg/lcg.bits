package: looseversion
description: looseversion simple Python version comparison
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/looseversion-1.3.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################