package: pastel
description: Pastel bring colors to your terminal
version: "0.2.1"
tag: "0.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pastel-0.2.1.tar.gz
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