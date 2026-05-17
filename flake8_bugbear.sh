package: flake8_bugbear
description: flake8-bugbear extra opinionated warnings for Flake8
version: "25.10.21"
tag: "25.10.21"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/flake8_bugbear-25.10.21.tar.gz
requires:
  - Python
  - flake8
  - attrs
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