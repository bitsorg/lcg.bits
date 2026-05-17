package: wheel
description: wheel Python built-package format (PEP 427)
version: "0.45.1"
tag: "0.45.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wheel-0.45.1.tar.gz
requires:
  - Python
  - setuptools
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
